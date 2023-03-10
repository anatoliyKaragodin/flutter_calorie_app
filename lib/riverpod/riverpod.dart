import 'package:flutter_calorie_app/DB/models/user_data_model.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../DB/db_helper/constants.dart';
import '../DB/models/product_model.dart';

final myAppPageIndexProvider = StateProvider<int>((ref) => 0);

final selectedDayProvider = StateProvider<int>((ref) {
return Jiffy().date;
});

final selectedDayProductsProvider = StateProvider<List<ProductModel>>((ref) {
  return [];
});
