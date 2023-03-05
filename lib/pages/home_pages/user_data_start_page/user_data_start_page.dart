import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_borders.dart';

import 'form_field_widget.dart';

enum SingingCharacter { lafayette, jefferson }

class UserDataStartPage extends StatefulWidget {
  const UserDataStartPage({Key? key}) : super(key: key);

  @override
  State<UserDataStartPage> createState() => _UserDataStartPageState();
}

class _UserDataStartPageState extends State<UserDataStartPage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> listOfHints = [
    'Enter height',
    'Enter weight',
    'Enter age'
  ];
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            // height: Dimensions.screenHeight,
            // width: Dimensions.screenWidth,
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Form fields
                    SizedBox(
                      height: Dimensions.height10 * 22,
                      width: Dimensions.width10*15,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return FormFieldWidget(
                              hintText: listOfHints[index],
                            );
                          }),
                    ),

                    /// Gender
                    SizedBox(
                      width: Dimensions.width10*20,
                      height: Dimensions.height10 * 7,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: Dimensions.height10 * 3,
                            width: Dimensions.width10 * 15,
                            child: ListTile(
                              title: const Text('Male'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.lafayette,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10 * 3,
                            width: Dimensions.width10 * 15,
                            child: ListTile(
                              title: const Text('Female'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.jefferson,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height10*5,),

                    /// Submit button
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: MyBorders.borderRadius20,
                        ),
                      )),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
