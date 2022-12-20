import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_list_model.dart';
import '../modules/login/screens/homepages/contact_screen.dart';
import '../modules/login/screens/homepages/faq_screen.dart';
import '../services/category_service.dart';

class HomeScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  CategoryListModel? categoryListModel;
  RxInt categoryIndex = 0.obs;
  RxBool isVisible = false.obs;

  menuBarListIndex(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      return Text(
        "Shop Now",
        style: TextStyle(color: Colors.white, fontSize: 50),
      );
    } else if (index == 1) {
      print(CategoryService().categoryList());

      return Text(
        "Index value is $index",
        style: TextStyle(color: Colors.white, fontSize: 50),
      );
    } else if (index == 2) {
      return FaqScreen();
    } else {
      return ContactScreen();
    }
  }

  collectionListIndex(int index) {
    if (index == 0) {
      isVisible.value = false;
    } else if (index == 1) {
      isVisible.value = !isVisible.value;
    } else if (index == 2) {
      isVisible.value = false;
    } else if (index == 3) {
      isVisible.value = false;
    } else {
      return Container();
    }
  }

  categoryList() async {
    categoryListModel = await CategoryService().categoryList();
    print(categoryListModel);
    return categoryListModel;
  }

  selectCategory(int i) {
    categoryIndex.value = i;
    update();
  }
}
