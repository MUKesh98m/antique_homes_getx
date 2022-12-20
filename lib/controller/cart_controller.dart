import 'package:get/get.dart';

import '../model/cart_list_model.dart';
import 'package:flutter/material.dart';

import '../services/cart_service.dart';

class CartScreenController extends GetxController {
  CartListModel? cartListModel;

  cartList() async {
    cartListModel = await CartService().cartList();

    return cartListModel;
  }
}
