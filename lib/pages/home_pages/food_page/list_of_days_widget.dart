import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';
import 'package:flutter_calorie_app/utils/my_parameters.dart';

class ListOfDaysWidget extends StatefulWidget {
  const ListOfDaysWidget({Key? key}) : super(key: key);

  @override
  State<ListOfDaysWidget> createState() => _ListOfDaysWidgetState();
}

class _ListOfDaysWidgetState extends State<ListOfDaysWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.height10*16,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.all(Dimensions.width10),
        /// Day information
        child: InkWell(child:
          Container(
            decoration: BoxDecoration(color: MyColors.mainColor,
            borderRadius: MyParameters.borderRadius20),
            width: Dimensions.width10*15,
            child: Column(
              children: [
                /// Date
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10/2,
                  bottom: Dimensions.height10/2),
                  child: Text('1 Monday'),
                ),
                /// Calories
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10/2,
                      bottom: Dimensions.height10/2),
                  child: Text('Calories: 200'),
                ),
                /// Proteins
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10/2,
                      bottom: Dimensions.height10/2),
                  child: Text('Proteins:'),
                ),
                /// Fats
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10/2,
                      bottom: Dimensions.height10/2),
                  child: Text('Fats:'),
                ),
                /// Carbohydrates
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10/2,
                      bottom: Dimensions.height10/2),
                  child: Text('Carbohydrates:'),
                ),
              ],
            ),
          ),),
      );
    }),);
  }
}
