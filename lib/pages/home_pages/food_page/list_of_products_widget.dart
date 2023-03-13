import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
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
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(selectedDayProductsProvider);
    final isLoaded = ref.watch(isLoadedProvider);
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
                      color: MyColors.mainColor!.withOpacity(0.2),
                      borderRadius: MyParameters.borderRadius20),
                  width: Dimensions.width10 * 10,
                  child: Column(
                    children: [
                      /// Label
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(products[index].label),
                      ),

                      /// Calories
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Calories: ${products[index].calories.toString()} kcal'),
                      ),

                      /// Proteins
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Proteins: ${products[index].proteins.toString()} g'),
                      ),

                      /// Fats
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Fats: ${products[index].fats.toString()} g'),
                      ),

                      /// Carbohydrates
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Carbohydrates: ${products[index].carbohydrates.toString()} g'),
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
