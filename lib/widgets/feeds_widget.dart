// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:storeapp/screens/product.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:provider/provider.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel prodctmodelprovider = Provider.of<ProductModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
            width: size.width * 0.45,
            child: Material(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple[50],
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: ProductsPage(
                                id: prodctmodelprovider.id.toString(),
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                    text: '  \$ ${prodctmodelprovider.price}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w600)),
                                    ]),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FancyShimmerImage(
                            errorWidget: const Icon(Icons.error),
                            boxFit: BoxFit.fill,
                            height: size.height * 0.2,
                            width: double.infinity,
                            imageUrl: prodctmodelprovider.images![0],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            prodctmodelprovider.title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                      ],
                    )))));
  }
}
