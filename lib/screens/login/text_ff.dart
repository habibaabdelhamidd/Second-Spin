import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  final String hint;
  final bool astrik;
  final FormFieldValidator<String> validator;
  Widget? icon;
  final TextEditingController textEditingController;
  TextF({super.key, required this.hint, required this.astrik, required this.textEditingController, required this.validator,this.icon} );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    alignment: Alignment.center,
    child: TextFormField(
      style: theme.textTheme.labelMedium,
      obscureText: astrik,
      controller: textEditingController,
      validator: validator,
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
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey,width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
        hintText: hint,
        hintStyle: theme.textTheme.labelSmall,
       suffixIcon: icon,
      )
    ));
  }
}
