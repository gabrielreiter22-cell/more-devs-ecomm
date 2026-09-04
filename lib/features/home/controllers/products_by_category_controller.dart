import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/products_model.dart';



enum ProductViewState { brand, name, imageUrl, price, category }


class ProductsByCategoryController {



class ProductsByCategoryController extends ChangeNotifier {
  List<Products> products = [];
}


}

