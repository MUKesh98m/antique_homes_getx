import 'package:antique_homes_getx/modules/login/screens/homepages/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_preference.dart';
import '../../../../common/app_string.dart';
import '../../../../common/controller/getx_provider.dart';
import '../../../../controller/homescreen_controller.dart';
import '../../widgets/base_layout.dart';
import 'contact_screen.dart';
import 'faq_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List menuBarList = ['HOME', 'COLLECTIONS', 'FAQ', 'CONTACT'];

  // int selectedIndex = 0;
  bool UserProfile = false;
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 100, right: 100, bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [
                    SizedBox(
                      width: 750,
                      height: 38,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: menuBarList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(() => Container(
                                // color: Colors.red,
                                height: 20,
                                width: 150,
                                margin: const EdgeInsets.only(left: 30),
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                side:
                                                    homeScreenController.selectedIndex == index
                                                        ? const BorderSide(
                                                            color: AppColors
                                                                .borderColor)
                                                        : const BorderSide(
                                                            color: Colors
                                                                .transparent))),
                                        backgroundColor: MaterialStateProperty.all(
                                            AppColors.menubarButtonColor.withOpacity(0.5))),
                                    onPressed: () {
                                      homeScreenController
                                          .menuBarListIndex(index);
                                      homeScreenController
                                          .collectionListIndex(index);
                                    },
                                    child: Text(
                                      menuBarList[index],
                                      style: TextStyle(
                                          color: homeScreenController
                                                      .selectedIndex ==
                                                  index
                                              ? AppColors.borderColor
                                              : AppColors.textColor),
                                    ))));
                          }),
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                border: Border.all(
                                    color: AppColors.searchButtonColor,
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            width: 190,
                            height: 38,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2.0,
                                      color: AppColors.searchButtonColor),
                                ),
                              ),
                              margin: const EdgeInsets.only(
                                  left: 15, bottom: 5, right: 15),
                              child: TextField(
                                onChanged: (val) {},
                                style: const TextStyle(
                                    color: AppColors.borderColor),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search,
                                        color: AppColors.searchButtonColor),
                                    hintText: AppStrings.searchButtonText,
                                    hintStyle: TextStyle(
                                        color: AppColors.searchButtonColor,
                                        fontFamily: 'Libre',
                                        fontSize: 16)),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 30,
                          color: AppColors.searchButtonColor,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          bool val =
                              AppPreference.getBool(AppStrings.loginStatus);
                          print(val);
                          if (!val) {
                            Get.toNamed("/login");
                          } else {
                            Get.toNamed("/cart");
                          }
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: AppColors.searchButtonColor,
                        ))
                  ],
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: homeScreenController.isVisible.value,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 750,
                      height: 38,
                      // color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenController
                              .categoryListModel?.data!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Obx(() => Container(
                                // color: Colors.red,
                                height: 47,
                                width: 110,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: homeScreenController
                                                        .categoryIndex ==
                                                    i
                                                ? AppColors.borderColor
                                                : AppColors.blackColor))),
                                margin: const EdgeInsets.only(left: 30),
                                child: TextButton(
                                    onPressed: () {
                                      homeScreenController.selectCategory(i);
                                    },
                                    child: Text(
                                      homeScreenController.categoryListModel
                                              ?.data![i].name ??
                                          'Data',
                                      style: TextStyle(
                                          color: homeScreenController
                                                      .categoryIndex ==
                                                  i
                                              ? AppColors.borderColor
                                              : AppColors.textColor),
                                    ))));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                  flex: 6,
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.red,
                      child: homeScreenController.menuBarListIndex(
                          homeScreenController.selectedIndex.toInt()))),
            )
          ],
        ),
      ),
    );
  }
}
