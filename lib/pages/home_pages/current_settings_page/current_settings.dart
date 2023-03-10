import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/add_button_settings.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../DB/db_helper/db_helper.dart';
import '../../../DB/models/user_data_model.dart';
import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';
import '../main_app_page/main_app_page.dart';

class CurrentSettingsPage extends StatefulWidget {
  final String route = 'current settings page';
  final String label = 'Current settings';
  const CurrentSettingsPage({Key? key}) : super(key: key);

  @override
  State<CurrentSettingsPage> createState() => _CurrentSettingsPageState();
}

class _CurrentSettingsPageState extends State<CurrentSettingsPage> {
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MainAppPage().route);
            },
            icon: MyParameters.backIcon),
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.width10 * 3.5),
          child: Text(widget.label),
        ),
      ),
      body: Center(
        child: Container(
          height: Dimensions.height10 * 14,
          width: Dimensions.width10 * 25,
          decoration: BoxDecoration(
              borderRadius: MyParameters.borderRadius20,
              color: MyColors.mainColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Height: $currentUserHeight cm'),
              Text('Weight: $currentUserWeight kg'),
              Text('Age: $currentUserAge'),
            ],
          ),
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
    Navigator.of(context).pushNamed(AddButton().route);
  },
  child: Icon(Icons.add),
  );
  }
}