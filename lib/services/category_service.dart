import 'package:dio/dio.dart';

import '../common/app_preference.dart';
import '../common/app_string.dart';
import '../common/indicator.dart';
import '../model/category_list_model.dart';

class CategoryService {
  final Dio _dio = Dio();

  Future<CategoryListModel?> categoryList() async {
    try {
      showLoadingIndicator();
      final Response response = await _dio.get(
          '${AppStrings.baseUrl}api/category',
          options: Options(headers: {
            "Authorization":
                "Bearer ${AppPreference.getString(AppStrings.token)}"
          }));
      print('categorylist ----->  ${response.data}');
      hideLoadingIndicator();
      return CategoryListModel.fromJson(response.data);
    } catch (e) {
      print('${e}');
    }
    return null;
  }
}
