import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';

class FormFieldWidget extends StatefulWidget {
  final hintText;
  const FormFieldWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10 * 7,
      // width: Dimensions.width10 * 10,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: widget.hintText),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
