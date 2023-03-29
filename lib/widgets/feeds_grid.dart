import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/widgets/feeds_widget.dart';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/apiServices/api_calls.dart';

class FeedsGrid extends StatelessWidget {
  final List<ProductModel> productsList;
  FeedsGrid({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
            value: productsList[index], child: const FeedsWidget());
      },
    );
  }
}
