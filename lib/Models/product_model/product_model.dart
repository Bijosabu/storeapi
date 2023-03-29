import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
