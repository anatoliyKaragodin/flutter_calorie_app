import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../user_data/user_data.dart';

class MixedGraphicWidget extends StatefulWidget {
  const MixedGraphicWidget({Key? key}) : super(key: key);

  @override
  State<MixedGraphicWidget> createState() => _MixedGraphicWidgetState();
}

class _MixedGraphicWidgetState extends State<MixedGraphicWidget> {
  final listOfItemColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.amber
  ];
  final listOfLabels = ['calories', 'proteins', 'fats','carbohydrates'];
  @override
  Widget build(BuildContext context) {
    /// Mixed graphic
    return Column(
      children: [
        Text('Calories, proteins, fats, carbohydrates monthly'),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: Dimensions.width10 * 35,
          height: Dimensions.height10 * 30,
          child: Stack(children: [
            Chart(
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
              axes: [
                Defaults.horizontalAxis..tickLine = TickLine(),
                Defaults.verticalAxis,
              ],
              elements: [
                IntervalElement(
                    size: SizeAttr(value: 1),
                    color: ColorAttr(variable: 'type', values: listOfItemColors),
                    modifiers: [DodgeModifier()],
                    position:
                        Varset('index') * Varset('value') / Varset('type'))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height10 * 28.8),
              child: Container(
                height: Dimensions.height10,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Column(
            children: [
            Container(
              height: Dimensions.height10,
              width: Dimensions.width10,
              decoration: BoxDecoration(color: listOfItemColors[0]),
            ),
            SizedBox(height: Dimensions.height10,),
            Text(listOfLabels[0])
          ],),
          Column(
            children: [
              Container(
                height: Dimensions.height10,
                width: Dimensions.width10,
                decoration: BoxDecoration(color: listOfItemColors[1]),
              ),
              SizedBox(height: Dimensions.height10,),
              Text(listOfLabels[1])
            ],),
          Column(
            children: [
              Container(
                height: Dimensions.height10,
                width: Dimensions.width10,
                decoration: BoxDecoration(color: listOfItemColors[2]),
              ),
              SizedBox(height: Dimensions.height10,),
              Text(listOfLabels[2])
            ],),
          Column(
            children: [
              Container(
                height: Dimensions.height10,
                width: Dimensions.width10,
                decoration: BoxDecoration(color: listOfItemColors[3]),
              ),
              SizedBox(height: Dimensions.height10,),
              Text(listOfLabels[3])
            ],)
        ],)
      ],
    );
  }
}
