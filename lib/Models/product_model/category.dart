import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
part 'category.g.dart';

@JsonSerializable()
class Category with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
