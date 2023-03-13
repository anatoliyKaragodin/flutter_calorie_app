import 'package:flutter_calorie_app/DB/db_helper/db_helper.dart';
import 'package:flutter_calorie_app/main.dart';
import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../models/product_model.dart';

int startUserHeight = 0;
double startUserWeight = 0;
int startUserAge = 0;
bool startUserGenger = true;

int currentUserHeight = 0;
double currentUserWeight = 0;
int currentUserAge = 0;

class UserData {
  static List<Map<String, dynamic>> mixedData = [

  ];

  static List<Map<String, Object>> weightData = [
    {'date': '01', 'value': 275},
    {'date': '02', 'value': 115},
    {'date': '03', 'value': 120},
    {'date': '04', 'value': 350},
    {'date': '05', 'value': 150},
    {'date': '06', 'value': 275},
    {'date': '07', 'value': 115},
    {'date': '08', 'value': 120},
    {'date': '09', 'value': 350},
    {'date': '10', 'value': 150},
    {'date': '11', 'value': 275},
    {'date': '12', 'value': 115},
    {'date': '13', 'value': 120},
    {'date': '14', 'value': 350},
    {'date': '15', 'value': 150},
    {'date': '16', 'value': 275},
    {'date': '17', 'value': 115},
    {'date': '18', 'value': 120},
    {'date': '19', 'value': 350},
    {'date': '20', 'value': 150},
    {'date': '21', 'value': 150},
    {'date': '22', 'value': 275},
    {'date': '23', 'value': 115},
    {'date': '24', 'value': 120},
    {'date': '25', 'value': 350},
    {'date': '26', 'value': 150},
    {'date': '27', 'value': 275},
    {'date': '28', 'value': 115},
    {'date': '29', 'value': 120},
    {'date': '30', 'value': 350},
    {'date': '31', 'value': 150},
  ];

  Future<List<Map<String, Object>>> sortUserWeightsPerMonth (int month) async {

    final List<Map<String, Object>> listUserWeights = [];
    int daysInMonth = Jiffy().daysInMonth;
    var currentUserdata = await DBHelper.instance.readAllUserData();
    for(var item in currentUserdata) {
      if (Jiffy(item.createdTime).month == month) {
        listUserWeights.add({'date': item.createdTime, 'value': item.weight});
      }
    }
    weightData = listUserWeights;
    print('USER WEIGHTS LIST: $listUserWeights');
  return listUserWeights;
  }

}

class ProductsData {
  static List<ProductModel> listProducts = [];
  static List<ProductModel> listDayProducts = [];

  /// List of products per day
  List<ProductModel> sortByDay(int date) {

    List<ProductModel>? products = [];
    for (var product in listProducts) {
      if (Jiffy(product.createdDate).date == date) {
        products.add(product);
      }
    }

    return products;
  }

  /// List of month cal, proteins, fats, carbohydrates per day
  List<Map<String, dynamic>> calcByDay() {

    List<List<ProductModel>> products = [];
    List<Map<String, dynamic>> listCaloriesPerDay = [];
    int daysInMonth = Jiffy().daysInMonth;

    /// List of products in month by day
    for (int day = 1; day <= daysInMonth; day++) {
      products.add(sortByDay(day));
      listCaloriesPerDay.add({
        'date': day,
        'calories': 0,
        'proteins': 0,
        'fats': 0,
        'carbohydrates': 0
      });
    }

    /// Calc calories for day
    for (int day = 1; day < daysInMonth; day++) {
      double calories = 0;
      double proteins = 0;
      double fats = 0;
      double carbohydrates = 0;
      /// Calories by day
      for (int i = 0; i < products[day].length; i++) {

        calories += products[day][i].calories;
        proteins += products[day][i].proteins;
        fats += products[day][i].fats;
        carbohydrates += products[day][i].carbohydrates;
      }
      /// Add calories per day to map
      listCaloriesPerDay[day].addAll({
        'date': day,
        'calories': calories,
        'proteins': proteins,
        'fats': fats,
        'carbohydrates': carbohydrates
      });
    }

    for (int day = 1; day < daysInMonth; day++) {
    for (int i = 0; i <= 3; i++) {
      final listTypes = ['calories', 'proteins', 'fats', 'carbohydrates'];
      UserData.mixedData.add({
        'index': day,
        'type': listTypes[i],
        'value': listCaloriesPerDay[day][listTypes[i]],
      });

    }}
    // print('MIXED DATA: ${UserData.mixedData}');
    // print('CALORIES MAP: $listCaloriesPerDay');

    return listCaloriesPerDay;

  }
}
