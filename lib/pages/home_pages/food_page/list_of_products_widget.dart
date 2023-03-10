import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
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
          itemCount: ProductsData.listProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(Dimensions.width10),
              /// Product information
              child: InkWell(child:
              Container(
                decoration: BoxDecoration(color: MyColors.mainColor!.withOpacity(0.2),
                    borderRadius: MyParameters.borderRadius20),
                width: Dimensions.width10*10,
                child: Column(
                  children: [
                    /// Label
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text(ProductsData.listProducts[index].label),
                    ),
                    /// Calories
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text('Calories: ${ProductsData.listProducts[index].calories.toString()} kcal'),
                    ),
                    /// Proteins
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text('Proteins: ${ProductsData.listProducts[index].proteins.toString()} g'),
                    ),
                    /// Fats
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text('Fats: ${ProductsData.listProducts[index].fats.toString()} g'),
                    ),
                    /// Carbohydrates
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10/2,
                          bottom: Dimensions.height10/2),
                      child: Text('Carbohydrates: ${ProductsData.listProducts[index].carbohydrates.toString()} g'),
                    ),
                  ],
                ),
              ),),
            );
          }),);
  }
}
