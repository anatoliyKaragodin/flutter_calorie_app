import 'package:flutter_calorie_app/DB/models/user_data_model.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../DB/db_helper/constants.dart';

final myAppPageIndexProvider = StateProvider<int>((ref) => 0);

final selectedDayProvider = StateProvider<int>((ref) {
return Jiffy().date;
});

