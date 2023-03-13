import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';

class FormFieldWidget extends ConsumerStatefulWidget {
  final String hintText;
  final StateProvider? onSaved;
  const FormFieldWidget({Key? key, required this.hintText, this.onSaved}) : super(key: key);

  @override
  ConsumerState<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends ConsumerState<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10 * 7,
      // width: Dimensions.width10 * 10,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
             ref.watch(widget.onSaved!.notifier).update((state) => value);
            },
            decoration: InputDecoration(hintText: widget.hintText),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter data';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
