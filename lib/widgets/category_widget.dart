import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:storeapp/Models/product_model/category.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Category categoryProvider = Provider.of<Category>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              errorWidget: const Icon(Icons.error),
              height: size.height * 0.20,
              width: size.width * 0.45,
              imageUrl: categoryProvider.image!,
              boxFit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            categoryProvider.name!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey[300]!.withOpacity(0.5)),
          ),
        )
      ],
    );
  }
}
