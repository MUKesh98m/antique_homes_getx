import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_preference.dart';
import '../../../../common/app_string.dart';
import '../../widgets/button.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({Key? key, this.homeScreenController}) : super(key: key);
  final homeScreenController;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: homeScreenController.productListModel?.data!.data!.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext fcontext, int i) {
          return Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(
                left: 15,
              ),
              width: 210,
              color: AppColors.collectionCartBackgroundColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: AppColors.buttonColor,
                          width: 210,
                          child: Image.network(
                            alignment: Alignment.center,
                            "${homeScreenController.productListModel?.data!.data![i].img!}",
                            fit: BoxFit.cover,
                            width: 10,
                            height: 10,
                          ),
                        )),
                    Expanded(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Brass",
                              style: TextStyle(color: AppColors.whiteColor)),
                          const SizedBox(height: 2),
                          Text(
                              "Name : ${homeScreenController.productListModel?.data!.data![i].name}",
                              style:
                                  const TextStyle(color: AppColors.whiteColor)),
                          const SizedBox(height: 2),
                          Text(
                              "Rs.${homeScreenController.productListModel?.data!.data![i].mrp}",
                              style:
                                  const TextStyle(color: AppColors.whiteColor)),
                          const SizedBox(
                            height: 5,
                          ),
                          buttons(
                            buttonname: AppStrings.buttontextaddtocart,
                            buttonheight: 30,
                            buttonwidth: MediaQuery.of(context).size.width,
                            onTap: () async {
                              bool val =
                                  AppPreference.getBool(AppStrings.loginStatus);
                              if (!val) {
                                Navigator.of(context).pushNamed('/login');
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => LoginScreen()));
                              } else {
                                homeScreenController.addToCart(
                                    homeScreenController.productListModel!.data!
                                        .data![i].productId!,
                                    context);
                              }
                            },
                            fontsize: 10,
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    )),
                  ]),
            ),
          ]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
