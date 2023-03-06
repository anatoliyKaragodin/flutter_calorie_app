import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../user_data/user_data.dart';

class MixedGraphicWidget extends StatefulWidget {
  const MixedGraphicWidget({Key? key}) : super(key: key);

  @override
  State<MixedGraphicWidget> createState() => _MixedGraphicWidgetState();
}

class _MixedGraphicWidgetState extends State<MixedGraphicWidget> {
  @override
  Widget build(BuildContext context) {
    return  /// Mixed graphic
      Column(
        children: [
          Text('Calories, proteins, fats, carbohydrates per month'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: Dimensions.width10*35,
            height: Dimensions.height10*30,
            child: Chart(
              // padding: (_) => const EdgeInsets.fromLTRB(40, 5, 10, 40),
              data: UserData.mixedData,
              variables: {
                'index': Variable(
                  accessor: (Map map) => map['index'].toString(),
                ),
                'type': Variable(
                  accessor: (Map map) => map['type'] as String,
                ),
                'value': Variable(
                  accessor: (Map map) => map['value'] as num,
                ),
              },
              // marks: [
              //   IntervalMark(
              //     position: Varset('index') * Varset('value') / Varset('type'),
              //     color: ColorEncode(variable: 'type', values: Defaults.colors10),
              //     size: SizeEncode(value: 2),
              //     modifiers: [DodgeSizeModifier()],
              //   )
              // ],
              axes: [
                Defaults.horizontalAxis..tickLine = TickLine(),
                Defaults.verticalAxis,
              ],
              elements: [IntervalElement(
                  size: SizeAttr(value: 1),
                  color: ColorAttr(variable: 'type', values: [Colors.red, Colors.green, Colors.blue, Colors.purpleAccent, Colors.amber]),
                  modifiers: [DodgeModifier()],
                  position: Varset('index') * Varset('value') / Varset('type')
              )],
            ),
          ),
        ],
      );
  }
}
