import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_parameters.dart';
import '../main_app_page/main_app_page.dart';

class ProfilePage extends StatefulWidget {
  final String route = 'profile page';
  final String label = 'Profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          padding: EdgeInsets.only(left: Dimensions.width10 * 8),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Male'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Starting:'),
                      Text('Height: 178 cm'),
                      Text('Weight: 91 kg'),
                      Text('Age: 34'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Current:'),
                      Text('Height: 178 cm'),
                      Text('Weight: 91 kg'),
                      Text('Age: 34'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
