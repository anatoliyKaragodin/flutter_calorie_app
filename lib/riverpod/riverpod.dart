import 'package:flutter_calorie_app/DB/models/user_data_model.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../DB/db_helper/constants.dart';

final myAppPageIndexProvider = StateProvider<int>((ref) => 0);

/// User start data
final userStartGenderProvider = StateProvider<bool>((ref) {
  return false ;
});

final userStartAgeProvider = StateProvider<int>((ref) {
  return 0;
});

final userStartHeightProvider = StateProvider<int>((ref) {
  return 0;
});

final userStartWeightProvider = StateProvider<double>((ref) {
  return 0.0;
});
