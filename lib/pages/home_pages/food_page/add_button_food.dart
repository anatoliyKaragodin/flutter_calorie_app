import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/form_field_widget.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_parameters.dart';

class AddButton extends StatefulWidget {
  final String label = 'Add product';
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final List<String> listOfHints = [
    'Enter product',
    'Enter calories',
    'Enter proteins',
    'Enter fats',
    'Enter carbohydrates',
  ];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
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
                    height: Dimensions.height10 * 50,
                    width: Dimensions.width10 * 30,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        /// Form fields
                        Form(
                          child: SizedBox(
                            height: Dimensions.height10 * 40,
                            width: Dimensions.width10 * 15,
                            child: ListView.builder(
                                itemCount: listOfHints.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FormFieldWidget(
                                    hintText: listOfHints[index],
                                  );
                                }),
                          ),
                        ),
                        /// Add button
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: MyParameters.borderRadius20,
                                  ))),
                          onPressed: () {
                            Navigator.pop(context);
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
            });
      },
      child: Icon(Icons.add),
    );
  }
}
