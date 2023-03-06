import 'package:flutter_calorie_app/utils/library.dart';

import '../../../user_data/user_data.dart';
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
        Text('Weight change per month'),
        SizedBox(
          height: Dimensions.height10*20,
          child: Chart(
            data: UserData.weightData,
            variables: {
              'date': Variable(
                accessor: (Map map) => map['date'] as String,
              ),
              'value': Variable(
                accessor: (Map map) => map['value'] as num,
              ),
            },
            elements: [IntervalElement(
              size: SizeAttr(value: 9)
            )],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        ),
      ],
    );
  }
}
