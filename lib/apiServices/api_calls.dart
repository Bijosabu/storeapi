import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:storeapp/Models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/Models/product_model/category.dart';
import 'package:storeapp/Models/userModel/user_model/user_model.dart';

class ApiCalls {
  String? limit;
  Future<List<ProductModel>> getAllProducts({required String limit}) async {
    // ValueNotifier<List<ProductModel>> productList = ValueNotifier([]);
    @override
    final response = await http.get(Uri.parse(
        'https://api.escuelajs.co/api/v1/products?offset=0&limit=$limit'));
    final data = jsonDecode(response.body) as List<dynamic>;

    List<ProductModel> products =
        data.map((json) => ProductModel.fromJson(json)).toList();
    print(products);
    // productList.value = products;
    // productList.notifyListeners();
    return products;
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
      final data = jsonDecode(response.body) as List<dynamic>;
      List<Category> categories =
          data.map((json) => Category.fromJson(json)).toList();
      return categories;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<UserModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/users'));
    final data = jsonDecode(response.body) as List<dynamic>;
    List<UserModel> userList =
        data.map((json) => UserModel.fromJson(json)).toList();
    return userList;
  }

  Future<ProductModel> getProductById(String id) async {
    final response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/products/4$id'));
    final data = jsonDecode(response.body);
    final model = ProductModel.fromJson(data);
    return model;
  }
}
