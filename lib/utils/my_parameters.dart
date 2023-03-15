import 'package:flutter_calorie_app/utils/library.dart';

import 'dimensions_util.dart';
import 'my_colors.dart';

class MyParameters {
  static BorderRadius borderRadius20 =
      BorderRadius.circular(Dimensions.height10 * 2);
  static Icon backIcon = Icon(Icons.arrow_back_ios);
  static double bigFontSize = Dimensions.height10 * 1.7;
  static double normalFontSize = Dimensions.height10 * 1.5;
  static FontWeight boldFont = FontWeight.bold;
  static BoxDecoration backgroundImage = const BoxDecoration(
      image: DecorationImage(
    opacity: 1.0,
    image: AssetImage('assets/фон 2 (3).png'),
    fit: BoxFit.cover,
  ));
  static UnderlineInputBorder underlineBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: MyColors.whiteColor!));
  static TextStyle whiteTextStyle = TextStyle(color: MyColors.whiteColor);
  static List<BoxShadow> boxShadow = [BoxShadow(
  color: MyColors.blackColor12!,
  spreadRadius: 3,
  blurRadius: 3
  )];
}
