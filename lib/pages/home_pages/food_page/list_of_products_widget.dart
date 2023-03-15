import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';

class ListOfProductsWidget extends ConsumerStatefulWidget {
  const ListOfProductsWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ListOfProductsWidget> createState() => _ListOfProductsWidgetState();
}

class _ListOfProductsWidgetState extends ConsumerState<ListOfProductsWidget> {
  final normalTextStyle = TextStyle(
      color: MyColors.whiteColor,
      fontSize: MyParameters.normalFontSize,
      fontWeight: MyParameters.boldFont);
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(selectedDayProductsProvider);
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(Dimensions.width10),

              /// Product information
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: MyParameters.boxShadow,
                      color: MyColors.mainColor200!.withOpacity(0.7),
                      borderRadius: MyParameters.borderRadius20),
                  width: Dimensions.width10 * 10,
                  child: Column(
                    children: [
                      /// Label
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(products[index].label, style: normalTextStyle,),
                      ),

                      /// Calories
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Calories: ${products[index].calories.toString()} kcal', style: normalTextStyle,),
                      ),

                      /// Proteins
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Proteins: ${products[index].proteins.toString()} g', style: normalTextStyle,),
                      ),

                      /// Fats
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Fats: ${products[index].fats.toString()} g', style: normalTextStyle,),
                      ),

                      /// Carbohydrates
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Carbohydrates: ${products[index].carbohydrates.toString()} g', style: normalTextStyle,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
