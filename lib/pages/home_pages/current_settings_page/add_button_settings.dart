import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/current_settings.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../DB/db_helper/db_helper.dart';
import '../../../DB/models/user_data_model.dart';
import '../../../DB/user_data/user_data.dart';
import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';

class AddButton extends StatefulWidget {
  final String route = 'add button settings';
  final String label = 'Update your data';
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final _formKey = GlobalKey<FormState>();
  final List<String> listOfHints = [
    'Enter new height',
    'Enter new weight',
    'Enter new age',
  ];
  final List<TextEditingController> listOfTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainColor200,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: MyParameters.backIcon),
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.width10 * 3.5),
          child: Text(widget.label),
        ),
      ),
      body: Center(
        child: Container(
          height: Dimensions.height10 * 40,
          width: Dimensions.width10 * 30,
          // color: Colors.red,
          child: Column(
            children: [
              /// Form fields
              Form(
                key: _formKey,
                child: SizedBox(
                    height: Dimensions.height10 * 25,
                    width: Dimensions.width10 * 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height10 * 22,
                          width: Dimensions.width10 * 15,
                          child: SizedBox(
                            // height: Dimensions.height10 * 7,
                            // width: Dimensions.width10 * 10,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,

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
                              ],
                            ),
                          ),
                        ),

                      ],
                    )
                ),
              ),
              /// Update button
              ElevatedButton(
                style: ButtonStyle(

                    backgroundColor:
                    MaterialStatePropertyAll(MyColors.mainColor200),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: MyParameters.borderRadius20,
                      ),
                    )),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    /// Current data
                    currentUserHeight = int.parse(listOfTextControllers[0].text);
                    currentUserWeight = double.parse(listOfTextControllers[1].text);
                    currentUserAge = int.parse(listOfTextControllers[2].text);
                    /// New user data
                    UserDataModel userData = UserDataModel(
                        createdTime: DateTime.now(),
                        age: int.parse(listOfTextControllers[2].text),
                        height: int.parse(listOfTextControllers[0].text),
                        weight: double.parse(listOfTextControllers[1].text),
                        isMale: startUserGenger);
                    /// Save new user data
                    await DBHelper.instance.createUserData(tableUserData, userData);
                    /// Read all user weights
                    UserData().sortUserWeightsPerMonth(Jiffy().month);
                    Navigator.of(context).pushNamed(CurrentSettingsPage().route);
                  }
                },
                child: Text(
                  'Update', style: TextStyle(
                    fontSize: MyParameters.bigFontSize,
                    fontWeight: MyParameters.boldFont)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
