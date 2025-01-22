import 'dart:ffi';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var productResult = [
      Product(
          id: 1,
          productName: 'FirstProd',
          productImage: 'abd',
          productDescription: 'some description about product',
          price: 30,
      ),
      Product(
        id: 2,
        productName: 'secProd',
        productImage: 'abd',
        productDescription: 'some description about product',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'theProd',
        productImage: 'abd',
        productDescription: 'some description about product',
        price: 50,
      ),
      Product(
        id: 4 ,
        productName: 'fourProd',
        productImage: 'abd',
        productDescription: 'some description about product',
        price: 50,
      )
    ];

    products.value = productResult;

  }
}
