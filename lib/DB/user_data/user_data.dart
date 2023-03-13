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
  static List<Map<String, Object>> mixedData = [
    {"type": "Email", "index": 0, "value": 120},
    {"type": "Email", "index": 1, "value": 132},
    {"type": "Email", "index": 2, "value": 101},
    {"type": "Email", "index": 3, "value": 134},
    {"type": "Email", "index": 4, "value": 90},
    {"type": "Email", "index": 5, "value": 230},
    {"type": "Email", "index": 6, "value": 210},
    {"type": "Affiliate", "index": 0, "value": 220},
    {"type": "Affiliate", "index": 1, "value": 182},
    {"type": "Affiliate", "index": 2, "value": 191},
    {"type": "Affiliate", "index": 3, "value": 234},
    {"type": "Affiliate", "index": 4, "value": 290},
    {"type": "Affiliate", "index": 5, "value": 330},
    {"type": "Affiliate", "index": 6, "value": 310},
    {"type": "Video", "index": 0, "value": 150},
    {"type": "Video", "index": 1, "value": 232},
    {"type": "Video", "index": 2, "value": 201},
    {"type": "Video", "index": 3, "value": 154},
    {"type": "Video", "index": 4, "value": 190},
    {"type": "Video", "index": 5, "value": 330},
    {"type": "Video", "index": 6, "value": 410},
    {"type": "Direct", "index": 0, "value": 320},
    {"type": "Direct", "index": 1, "value": 332},
    {"type": "Direct", "index": 2, "value": 301},
    {"type": "Direct", "index": 3, "value": 334},
    {"type": "Direct", "index": 4, "value": 390},
    {"type": "Direct", "index": 5, "value": 330},
    {"type": "Direct", "index": 6, "value": 320},
    {"type": "Search", "index": 0, "value": 320},
    {"type": "Search", "index": 1, "value": 432},
    {"type": "Search", "index": 2, "value": 401},
    {"type": "Search", "index": 3, "value": 434},
    {"type": "Search", "index": 4, "value": 390},
    {"type": "Search", "index": 5, "value": 430},
    {"type": "Search", "index": 6, "value": 420},
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
      /// Calories by day
      for (int i = 0; i < products[day].length; i++) {
        double calories = 0;
        double proteins = 0;
        double fats = 0;
        double carbohydrates = 0;
        calories += products[day][i].calories;
        proteins += products[day][i].proteins;
        fats += products[day][i].fats;
        carbohydrates += products[day][i].carbohydrates;


         /// Add calories per day to map
         listCaloriesPerDay[day].addAll({
           'date': day,
           'calories': calories,
           'proteins': proteins,
           'fats': fats,
           'carbohydrates': carbohydrates
         });

      }
        }

    print('CALORIES MAP: $listCaloriesPerDay');

    return listCaloriesPerDay;
  }
}
