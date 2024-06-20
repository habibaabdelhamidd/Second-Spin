import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  final String hint;
  final bool astrik;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;
  Widget? icon;
  final Color? fieldColor;
  final TextEditingController? textEditingController;
  TextF(
      {super.key,
      required this.hint,
      required this.astrik,
      this.textEditingController,
      this.validator,
      this.icon,
      this.fieldColor,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: fieldColor),
        alignment: Alignment.center,
        child: TextFormField(
            style: theme.textTheme.labelMedium,
            obscureText: astrik,
            controller: textEditingController,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.3,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: hint,
              hintStyle: theme.textTheme.labelSmall,
              suffixIcon: icon,
            )));
  }
}
