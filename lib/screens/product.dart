// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:storeapp/Models/product_model/category.dart';

class ProductsPage extends StatelessWidget {
  final String id;
  ProductsPage({super.key, required this.id});
  // ProductModel? model;
  // List<Category>? category;
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    //   model = await ApiCalls().getProductById(id);
    //   category = await ApiCalls().getCategories();
    // });
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: FutureBuilder(
          future: ApiCalls().getProductById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const BackButton(
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '\$ ${snapshot.data!.price.toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          color: Colors.grey[200],
                          child: Text(
                            snapshot.data!.title.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text(
                      //     ' \$ ${model!.price.toString()} ',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: size.height * 0.3,
                              child: Swiper(
                                autoplay: true,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                      snapshot.data!.images![index].toString());
                                },
                                pagination: const SwiperPagination(
                                    builder: DotSwiperPaginationBuilder(
                                        size: 8,
                                        color: Colors.white,
                                        activeColor: Colors.blueGrey)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey[200],
                              child: Text(
                                snapshot.data!.description.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
