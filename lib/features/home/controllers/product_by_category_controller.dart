import 'package:flutter/material.dart';
// import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/models/products_model.dart';
import 'package:more_devs_do_zero/shared/mocks.dart';
//import 'package:more_devs_do_zero/routes.dart';

enum ProductsByCategoryViewState { loading, success, error }

class ProductsByCategoryController extends ChangeNotifier {
  List<Products> categoryProducts = [];
  String query = '';

  ProductsByCategoryViewState state = ProductsByCategoryViewState.loading;

  void changeState(ProductsByCategoryViewState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> getProductsByCategory(String category) async {
    changeState(ProductsByCategoryViewState.loading);
    await Future.delayed(const Duration(seconds: 3)); // simula a API

    try {
      categoryProducts = productsJson
          .map((item) => Products.fromJson(item)) // desserializa
          .where(
            (product) => product.category == category,
          ) // 👈 filtra categoria
          .toList();

      changeState(ProductsByCategoryViewState.success);
    } catch (e) {
      changeState(ProductsByCategoryViewState.error);
    }
  }
}
