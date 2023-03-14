import 'package:flutter_calorie_app/utils/library.dart';

import '../DB/models/product_model.dart';

final myAppPageIndexProvider = StateProvider<int>((ref) => 0);

final selectedDayProvider = StateProvider<int>((ref) {
return Jiffy().date;
});

final selectedDayProductsProvider = StateProvider<List<ProductModel>>((ref) {
  return [];
});

final isLoadedProvider = StateProvider<bool>((ref) => false);

/// Webview
final homePageProvider = StateProvider<int>((ref) {
  return 2;
});
