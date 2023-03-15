import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';

import '../../../DB/user_data/user_data.dart';
import '../../../utils/dimensions_util.dart';
import '../../../utils/my_parameters.dart';
import '../main_app_page/main_app_page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final String route = 'profile page';
  final String label = 'Profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final textStyle = TextStyle(
      color: MyColors.whiteColor,
      fontSize: MyParameters.bigFontSize,
      fontWeight: MyParameters.boldFont);
  @override
  Widget build(BuildContext context) {
    /// Riverpod watchers

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainColor200,
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
      body: Container(
        decoration: MyParameters.backgroundImage,
        child: Center(
          child: Container(
            height: Dimensions.height10 * 18,
            width: Dimensions.width10 * 30,
            decoration: BoxDecoration(
              boxShadow: MyParameters.boxShadow,
                borderRadius: MyParameters.borderRadius20,
                color: MyColors.mainColor200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(startUserGenger ? 'Male' : 'Female', style: TextStyle(
                    color: MyColors.whiteColor,
                    fontSize: MyParameters.bigFontSize,
                    fontWeight: MyParameters.boldFont)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Starting:', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Height: $startUserHeight cm', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Weight: $startUserWeight kg', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Age: $startUserAge', style: textStyle),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Current:', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Height: $currentUserHeight cm', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Weight: $currentUserWeight kg', style: textStyle),
                        SizedBox(height: Dimensions.height10/2,),
                        Text('Age: $currentUserAge', style: textStyle),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
