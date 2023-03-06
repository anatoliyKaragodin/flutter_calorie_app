import 'package:flutter_calorie_app/utils/library.dart';
import 'package:jiffy/jiffy.dart';

final exerciseNumberProvider = StateProvider<int>((ref) {
  return 0;
});

final myAppPageIndexProvider = StateProvider<int>((ref) => 0);
