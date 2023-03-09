import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/utils/library.dart';


import '../../../utils/dimensions_util.dart';

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
        Text('Weight monthly'),
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
                    size: SizeAttr(value: 9),
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
