import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_string.dart';
import '../../../../common/utils/validation.dart';
import '../../../../common/widget/inputfileds.dart';
import '../../../../controller/cart_controller.dart';

import '../../widgets/base_layout.dart';
import '../../widgets/button.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String route = '/cart';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController addresss = TextEditingController();

  TextEditingController landmark = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final CartScreenController cartScreenController =
      Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenController>(
      builder: (controller) => BaseLayout(
          body: Padding(
        padding:
            const EdgeInsets.only(left: 200, top: 100, right: 200, bottom: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Column(children: [
            const Text(
              AppStrings.shoppingCartHeading,
              style: TextStyle(
                  fontSize: 34,
                  color: AppColors.textColor,
                  fontFamily: 'Libre',
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartScreenController.cartListModel?.flag == false
                    ? Expanded(
                        flex: 3,
                        child: Center(
                            child: Text(
                          'Cart is empty',
                          style: TextStyle(
                              fontSize: 30, color: AppColors.whiteColor),
                        )))
                    : Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.4,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cartScreenController
                                    .cartListModel?.data?.cart?.length ??
                                0,
                            // itemCount: cartScreenController
                            //     .cartListModel?.data?.cart?.length,
                            itemBuilder: (BuildContext context, index) {
                              return Card(
                                // elevation: 10,
                                color: AppColors.collectionCartBackgroundColor,
                                // shadowColor: Colors.white70,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              "${cartScreenController.cartListModel?.data?.cart![index].img}" ??
                                                  ''),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                width: 200,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  cartScreenController
                                                          .cartListModel
                                                          ?.data
                                                          ?.cart![index]
                                                          .name
                                                          .toString() ??
                                                      'Loading',
                                                  style: const TextStyle(
                                                      fontFamily: 'Libre',
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Container(
                                                width: 200,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  cartScreenController
                                                          .cartListModel
                                                          ?.data
                                                          ?.cart![index]
                                                          .description
                                                          .toString() ??
                                                      "Brass is an alloy  ",
                                                  style: const TextStyle(
                                                      fontFamily: 'Libre',
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                        Container(
                                            height: 100,
                                            width: 100,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Rs. ${cartScreenController.cartListModel?.data?.cart![index].mrp}",
                                              style: const TextStyle(
                                                  fontFamily: 'Libre',
                                                  color: AppColors.whiteColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            height: 100,
                                            width: 100,
                                            child: IconButton(
                                              icon: const Icon(Icons.delete,
                                                  size: 30),
                                              color: AppColors.whiteColor,
                                              onPressed: () {},
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                            width: 500,
                            height: 100,
                            color: AppColors.collectionCartBackgroundColor,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Total Price ",
                                  style: TextStyle(
                                      fontFamily: 'Libre',
                                      color: AppColors.whiteColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 180,
                                ),
                                cartScreenController.cartListModel?.flag ==
                                        false
                                    ? const Text(
                                        "Rs. 00",
                                        style: TextStyle(
                                            fontFamily: 'Libre',
                                            color: AppColors.whiteColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "Rs. ${cartScreenController.cartListModel?.data?.totalPrice.toString()}" ??
                                            '',
                                        style: const TextStyle(
                                            fontFamily: 'Libre',
                                            color: AppColors.whiteColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 500,
                          height: 380,
                          color: AppColors.collectionCartBackgroundColor,
                          child: addressFields(),
                        ),
                      ],
                    ))
              ],
            ),
          ]),
        ),
      )),
    );
  }

  addressFields() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              AppStrings.billingAddress,
              style: TextStyle(
                  fontSize: 34,
                  color: AppColors.buttonColor,
                  fontFamily: 'Libre',
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 450,
              child: textinputfield(
                text: AppStrings.address,
                // controllers: providerController.address,
                validator: validateAddress,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 450,
              child: textinputfield(
                text: AppStrings.landmark,
                // controllers: providerController.landmark,
                validator: nameValidation,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: textinputfield(
                      text: AppStrings.city,

                      // validator: cityValidation,
                      // controllers: providerController.city,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: textinputfield(
                      text: AppStrings.state,

                      // validator: stateValidation,
                      // controllers: providerController.state,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            buttons(
              buttonname: AppStrings.checkoutButtonText,
              buttonheight: 48,
              buttonwidth: 450,
              fontsize: 20,
              onTap: () {
                // if (formKey.currentState!.validate()) {
                //   Provider.of<CartScreenController>(context, listen: false)
                //       .placeOrder(context);
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
