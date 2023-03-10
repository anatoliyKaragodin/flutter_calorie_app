import 'package:flutter_calorie_app/DB/db_helper/db_helper.dart';
import 'package:flutter_calorie_app/DB/models/product_model.dart';
import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/pages/home_pages/food_page/food_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/form_field_widget.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_parameters.dart';

class AddButtonFood extends StatefulWidget {
  final String route = 'add button food';
  final String label = 'Add product';
  const AddButtonFood({Key? key}) : super(key: key);

  @override
  State<AddButtonFood> createState() => _AddButtonFoodState();
}

class _AddButtonFoodState extends State<AddButtonFood> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> listOfTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<String> listOfHints = [
    'Enter product',
    'Enter calories',
    'Enter proteins',
    'Enter fats',
    'Enter carbohydrates',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: MyParameters.backIcon),
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.width10 * 5),
          child: Text(widget.label),
        ),
      ),
      body: Center(
        child: Container(
          height: Dimensions.height10 * 45,
          width: Dimensions.width10 * 30,
          // color: Colors.red,
          child: Column(
            children: [
              /// Form fields
              Form(
                key: _formKey,
                child: SizedBox(
                    height: Dimensions.height10 * 35,
                    width: Dimensions.width10 * 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height10 * 35,
                          width: Dimensions.width10 * 15,
                          child: Column(
                            children: [
                              /// Product
                              TextFormField(
                                keyboardType: TextInputType.text,

                                controller: listOfTextControllers[0],
                                decoration:
                                    InputDecoration(hintText: listOfHints[0]),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[0];
                                  }
                                  return null;
                                },
                              ),

                              /// Calories
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: listOfTextControllers[1],
                                decoration:
                                    InputDecoration(hintText: listOfHints[1]),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[1];
                                  }
                                  return null;
                                },
                              ),

                              /// Proteins
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: listOfTextControllers[2],
                                decoration:
                                    InputDecoration(hintText: listOfHints[2]),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[2];
                                  }
                                  return null;
                                },
                              ),

                              /// Fats
                              TextFormField(
                                keyboardType: TextInputType.number,

                                controller: listOfTextControllers[3],
                                decoration:
                                    InputDecoration(hintText: listOfHints[3]),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[0];
                                  }
                                  return null;
                                },
                              ),

                              /// Carbohydrates
                              TextFormField(
                                keyboardType: TextInputType.number,

                                controller: listOfTextControllers[4],
                                decoration:
                                    InputDecoration(hintText: listOfHints[4]),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[0];
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),

              /// Add button
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: MyParameters.borderRadius20,
                ))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    /// Product data
                    var productData = ProductModel(
                        label: listOfTextControllers[0].text,
                        calories: double.parse(listOfTextControllers[1].text),
                        proteins: double.parse(listOfTextControllers[2].text),
                        fats: double.parse(listOfTextControllers[3].text),
                        carbohydrates: double.parse(listOfTextControllers[4].text),
                        createdDate: DateTime.now());
                    /// Save product data
                    await DBHelper.instance.createProductData(productData);
                    /// Read all products data
                    ProductsData.listProducts = await DBHelper.instance.readAllProductData();


                    Navigator.of(context).pushNamed(FoodPage().route);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      // fontSize: Dimensions.height10 * 3
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
