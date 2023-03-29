import 'package:flutter/material.dart';
import 'package:storeapp/widgets/category_widget.dart';
import 'package:storeapp/Models/product_model/category.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'dart:math';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurple[400]),
          backgroundColor: Colors.grey[200],
          centerTitle: true,
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: ApiCalls().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: snapshot.data![index],
                          child: const CategoryWidget());
                    },
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
