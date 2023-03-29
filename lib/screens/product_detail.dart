// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:storeapp/widgets/feeds_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapp/screens/product.dart';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:storeapp/widgets/feeds_grid.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final ScrollController _scrollController = ScrollController();
  // ValueNotifier<List<ProductModel>> productList = ValueNotifier([]);
  List<ProductModel> productList = [];
  int limit = 10;
  bool _isLoading = false;
  bool _isLimit = false;
  @override
  void initState() {
    getproducts();
    super.initState();
  }

  Future<void> getproducts() async {
    productList = await ApiCalls().getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;
        limit += 10;
        await getproducts();
        _isLoading = false;
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    //   productList = await ApiCalls().getAllProducts();
    // });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'All Products',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey[200],
          iconTheme: IconThemeData(color: Colors.deepPurple[400]),
        ),
        // body: productList != null
        //     ? SingleChildScrollView(child: FeedsGrid(productsList: productList))
        //     :const Center(child: CircularProgressIndicator()),

        body: productList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GridView.builder(
                        // controller: _scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                              value: productList[index],
                              child: const FeedsWidget());
                        },
                      ),
                    ),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ));
  }
}
