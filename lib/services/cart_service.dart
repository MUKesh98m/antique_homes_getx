import 'package:dio/dio.dart';

import '../common/app_preference.dart';
import '../common/app_string.dart';
import '../common/indicator.dart';
import '../model/cart_list_model.dart';

class CartService {
  final Dio _dio = Dio();

  Future<CartListModel?> cartList() async {
    try {
      showLoadingIndicator();
      final Response response = await _dio.get(
          '${AppStrings.baseUrl}api/cartList',
          options: Options(headers: {
            "Authorization":
                "Bearer ${AppPreference.getString(AppStrings.token)}"
          }));
      print(response.data);
      // print(AppPreference.getString(AppStrings.token));

      hideLoadingIndicator();

      return CartListModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return null;
  }
  //
  // Future<RemoveCartModel?> removeCart({int? cartId}) async {
  //   try {
  //     var data = {'cart_id': cartId};
  //     print(cartId);
  //     final Response response = await _dio.post(
  //         '${AppStrings.baseUrl}api/itemRemovefromCart',
  //         data: data,
  //         options: Options(headers: {
  //           "Authorization":
  //               "Bearer ${AppPreference.getString(AppStrings.token)}"
  //         }));
  //     print(response.data);
  //     return RemoveCartModel.fromJson(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future<PlaceOrderModel?> placeOrder({
  //   String? address,
  //   String? landmark,
  //   String? city,
  //   String? state,
  // }) async {
  //   try {
  //     var data = {
  //       "address": address,
  //       "landmark": landmark,
  //       "city": city,
  //       "state": state,
  //     };
  //     final Response response = await _dio.post(
  //         '${AppStrings.baseUrl}api/addOrder',
  //         data: data,
  //         options: Options(headers: {
  //           "Authorization":
  //               "Bearer ${AppPreference.getString(AppStrings.token)}"
  //         }));
  //     print(response);
  //     return PlaceOrderModel.fromJson(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
