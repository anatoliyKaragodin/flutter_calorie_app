import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';
import 'package:flutter_calorie_app/utils/my_parameters.dart';

class ListOfDaysWidget extends ConsumerStatefulWidget {
  const ListOfDaysWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ListOfDaysWidget> createState() => _ListOfDaysWidgetState();
}

class _ListOfDaysWidgetState extends ConsumerState<ListOfDaysWidget> {
  final normalTextStyle = TextStyle(
      color: MyColors.whiteColor,
      fontSize: MyParameters.normalFontSize,
      fontWeight: MyParameters.boldFont);
  final bigTextStyle = TextStyle(
      color: MyColors.whiteColor,
      fontSize: MyParameters.bigFontSize,
      fontWeight: MyParameters.boldFont);
  @override
  Widget build(BuildContext context) {
    var listOfDayData = ProductsData().calcByDay();

    final selectedDay = ref.watch(selectedDayProvider);
    return SizedBox(
      height: Dimensions.height10 * 18,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Jiffy().daysInMonth,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(Dimensions.width10),

              /// Day information
              child: InkWell(
                onTap: () {
                  /// Change selected day
                  ref
                      .read(selectedDayProvider.notifier)
                      .update((state) => index + 1);

                  /// Change selected day products
                  ref
                      .read(selectedDayProductsProvider.notifier)
                      .update((state) => ProductsData().sortByDay(index + 1));
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: MyParameters.boxShadow,
                      color: index + 1 == selectedDay
                          ? MyColors.mainColor200
                          : MyColors.mainColor200!.withOpacity(0.5),
                      borderRadius: MyParameters.borderRadius20),
                  width: Dimensions.width10 * 18,
                  child: Column(
                    children: [
                      /// Date
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            '${index+1} ${Jiffy('${Jiffy().year}/${Jiffy().month}/${index + 1}').EEEE}', style: bigTextStyle,),
                      ),

                      /// Calories
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Calories: ${listOfDayData[index]['calories']} kcal', style: normalTextStyle,),
                      ),

                      /// Proteins
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Proteins: ${listOfDayData[index]['proteins']} g', style: normalTextStyle,),
                      ),

                      /// Fats
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text('Fats: ${listOfDayData[index]['fats']} g', style: normalTextStyle,),
                      ),

                      /// Carbohydrates
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10 / 2,
                            bottom: Dimensions.height10 / 2),
                        child: Text(
                            'Carbohydrates: ${listOfDayData[index]['carbohydrates']} g', style: normalTextStyle,),
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
