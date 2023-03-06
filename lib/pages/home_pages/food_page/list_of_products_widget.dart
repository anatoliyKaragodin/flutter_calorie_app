import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';

class ListOfProductsWidget extends StatefulWidget {
  const ListOfProductsWidget({Key? key}) : super(key: key);

  @override
  State<ListOfProductsWidget> createState() => _ListOfProductsWidgetState();
}

class _ListOfProductsWidgetState extends State<ListOfProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10*51.7,
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(Dimensions.width10),
              /// Product information
              child: InkWell(child:
              Container(
                decoration: BoxDecoration(color: MyColors.mainColor,
                    borderRadius: MyParameters.borderRadius20),
                width: Dimensions.width10*10,
                child: Column(
                  children: [
                    /// Label
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text('Bread'),
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
