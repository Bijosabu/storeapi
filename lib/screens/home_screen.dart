// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:storeapp/widgets/app_bar_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/widgets/sale_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:storeapp/widgets/feeds_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapp/screens/product_detail.dart';
import 'Category_screen.dart';
import 'User_Screen.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/widgets/feeds_grid.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textController;
  int index = 0;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // List<ProductModel> listproduct = [];
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    //   listproduct = await ApiCalls().getAllProducts();
    // });
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          elevation: 4,
          backgroundColor: Colors.grey[200],
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          leading: AppBarIcon(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CategoryScreen(),
                      type: PageTransitionType.bottomToTop));
            },
            icons: IconlyBold.category,
          ),
          actions: [
            AppBarIcon(
              function: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const UserScreen(),
                        type: PageTransitionType.bottomToTop));
              },
              icons: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextField(
                controller: textController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    hintText: 'Search',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    suffixIcon: const Icon(
                      IconlyLight.search,
                      color: Colors.deepPurple,
                    )),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          autoplay: true,
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const saleWidget();
                          },
                          pagination: const SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  size: 8,
                                  color: Colors.white,
                                  activeColor: Colors.blueGrey)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Latest products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ProductDetail(),
                                        type: PageTransitionType.fade));
                              },
                              child: const Icon(
                                Icons.arrow_right,
                                size: 40,
                                color: Colors.deepPurple,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FutureBuilder(
                        future: ApiCalls().getAllProducts(limit: 5.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return FeedsGrid(productsList: snapshot.data!);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
