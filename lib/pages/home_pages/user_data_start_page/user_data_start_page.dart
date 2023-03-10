import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/pages/home_pages/main_app_page/main_app_page.dart';
import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';
import 'package:flutter_calorie_app/utils/my_parameters.dart';

import '../../../DB/db_helper/db_helper.dart';
import '../../../DB/models/user_data_model.dart';

class UserDataStartPage extends ConsumerStatefulWidget {
  final String route = 'user data start page';
  const UserDataStartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserDataStartPage> createState() => _UserDataStartPageState();
}

class _UserDataStartPageState extends ConsumerState<UserDataStartPage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> listOfHints = [
    'Enter height(cm)',
    'Enter weight(kg)',
    'Enter age'
  ];
  final List<TextEditingController> listOfTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  bool _isMale = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(UserDataStartPage().route);
        return true;
      },
      child: Scaffold(
        body: Container(
          decoration: MyParameters.backgroundImage,
          child: Center(
            child: SizedBox(
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Form fields
                      SizedBox(
                        height: Dimensions.height10 * 22,
                        width: Dimensions.width10 * 15,
                        child: SizedBox(
                          // height: Dimensions.height10 * 7,
                          // width: Dimensions.width10 * 10,
                          child: Column(
                            children: [
                              /// Height
                              TextFormField(
                                style: MyParameters.whiteTextStyle,
                                cursorColor: MyColors.whiteColor,
                                keyboardType: TextInputType.number,
                                controller: listOfTextControllers[0],

                                decoration: InputDecoration(
                                  enabledBorder: MyParameters.underlineBorder,
                                    focusedBorder: MyParameters.underlineBorder,
                                    hintText: listOfHints[0],
                                    hintStyle:
                                        TextStyle(color: MyColors.whiteColor),

                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[0];
                                  }
                                  return null;
                                },
                              ),

                              /// Weight
                              TextFormField(
                                style: MyParameters.whiteTextStyle,
                                cursorColor: MyColors.whiteColor,
                                keyboardType: TextInputType.number,
                                controller: listOfTextControllers[1],
                                decoration: InputDecoration(
                                    enabledBorder: MyParameters.underlineBorder,
                                    focusedBorder: MyParameters.underlineBorder,
                                    hintText: listOfHints[1],
                                    hintStyle:
                                        TextStyle(color: MyColors.whiteColor)),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return listOfHints[1];
                                  }
                                  return null;
                                },
                              ),

                              /// Age
                              TextFormField(
                                style: MyParameters.whiteTextStyle,
                                cursorColor: MyColors.whiteColor,
                                keyboardType: TextInputType.number,
                                controller: listOfTextControllers[2],
                                decoration: InputDecoration(
                                    enabledBorder: MyParameters.underlineBorder,
                                    focusedBorder: MyParameters.underlineBorder,
                                    hintText: listOfHints[2],
                                    hintStyle:
                                        TextStyle(color: MyColors.whiteColor)),
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

                      /// Gender
                      SizedBox(
                        width: Dimensions.width10 * 20,
                        height: Dimensions.height10 * 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: Dimensions.height10 * 3,
                              width: Dimensions.width10 * 16,
                              child: ListTile(
                                title: Text('Male',
                                    style: TextStyle(
                                        color: _isMale
                                            ? MyColors.whiteColor
                                            : MyColors.whiteColor70!
                                                .withOpacity(0.5),
                                        fontSize: MyParameters.bigFontSize,
                                        fontWeight: MyParameters.boldFont)),
                                leading: Radio<bool>(
                                  activeColor: MyColors.whiteColor,
                                  fillColor: MaterialStatePropertyAll(
                                      MyColors.whiteColor),
                                  value: true,
                                  groupValue: _isMale,
                                  onChanged: (value) {
                                    setState(() {
                                      _isMale = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 3,
                              width: Dimensions.width10 * 16,
                              child: ListTile(
                                title: Text('Female',
                                    style: TextStyle(
                                        color: !_isMale
                                            ? MyColors.whiteColor
                                            : MyColors.whiteColor70!
                                                .withOpacity(0.5),
                                        fontSize: MyParameters.bigFontSize,
                                        fontWeight: MyParameters.boldFont)),
                                leading: Radio<bool>(
                                  activeColor: MyColors.whiteColor,
                                  fillColor: MaterialStatePropertyAll(
                                      MyColors.whiteColor),
                                  value: false,
                                  groupValue: _isMale,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isMale = false;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 5,
                      ),

                      /// Submit button
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(MyColors.mainColor200),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: MyParameters.borderRadius20,
                              ),
                            )),
                        onPressed: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            /// Print entered texts
                            print(
                                '${listOfTextControllers[0].text} ${listOfTextControllers[1].text} ${listOfTextControllers[2].text}');

                            /// Change user data
                            startUserGenger = _isMale;
                            startUserHeight =
                                int.parse(listOfTextControllers[0].text);
                            startUserWeight =
                                double.parse(listOfTextControllers[1].text);
                            startUserAge =
                                int.parse(listOfTextControllers[2].text);

                            /// Current data
                            currentUserHeight =
                                int.parse(listOfTextControllers[0].text);
                            currentUserWeight =
                                double.parse(listOfTextControllers[1].text);
                            currentUserAge =
                                int.parse(listOfTextControllers[2].text);

                            /// Add user data to DB
                            UserDataModel userData = UserDataModel(
                                createdTime: DateTime.now(),
                                age: int.parse(listOfTextControllers[2].text),
                                height:
                                    int.parse(listOfTextControllers[0].text),
                                weight:
                                    double.parse(listOfTextControllers[1].text),
                                isMale: _isMale);
                            var id = await DBHelper.instance
                                .createUserData(tableUserDataStart, userData);
                            await DBHelper.instance
                                .createUserData(tableUserData, userData);

                            /// Read all user weights
                            UserData().sortUserWeightsPerMonth(Jiffy().month);
                            print('Create user data with ID: $id');

                            /// Go to MainAppPage()
                            Navigator.of(context)
                                .pushNamed(MainAppPage().route);
                          }
                        },
                        child: Text('Submit',
                            style: TextStyle(
                                fontSize: MyParameters.bigFontSize,
                                fontWeight: MyParameters.boldFont)),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
