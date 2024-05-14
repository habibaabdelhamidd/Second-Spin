import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String title;
  Color? imgColor;
  String? logo;
   Buttons({super.key, required this.title, this.logo, this.imgColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (logo != null) ?
            Image(image:  AssetImage("assets/image/$logo"),color: imgColor,) : const SizedBox(width:0.1),
            const SizedBox(width: 10),
            Text(title, style: theme.textTheme.labelLarge, textAlign: TextAlign.center,),
          ],
        ),
      );
  }
}
