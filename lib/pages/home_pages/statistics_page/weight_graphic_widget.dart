import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_colors.dart';


import '../../../utils/dimensions_util.dart';
import '../../../utils/my_parameters.dart';

class WeightGraphicWidget extends StatefulWidget {
  const WeightGraphicWidget({Key? key}) : super(key: key);

  @override
  State<WeightGraphicWidget> createState() => _WeightGraphicWidgetState();
}

class _WeightGraphicWidgetState extends State<WeightGraphicWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Weight monthly', style: TextStyle(
          color: MyColors.blackColor45,
            fontSize: MyParameters.normalFontSize,
            fontWeight: MyParameters.boldFont)),
        SizedBox(height: Dimensions.height10,),
        SizedBox(
          height: Dimensions.height10 * 20,
          child: Stack(
            children: [

              Chart(
                data: UserData.weightData,
                variables: {
                  'date': Variable(
                    accessor: (Map map) => map['date'].toString(),
                  ),
                  'value': Variable(
                    accessor: (Map map) => map['value'] as num,
                  ),
                },
                elements: [
                  IntervalElement(
                    color: ColorAttr(value: MyColors.mainColor200),
                    size: SizeAttr(value: 6),
                  )
                ],
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height10*18.8),
                child: Container(height: Dimensions.height10,
                  color: Theme.of(context).scaffoldBackgroundColor,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
