import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  static const String routeName = "SearchView";
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.toString(),style: theme.appBarTheme.titleTextStyle,),
      ),
    );
  }
}
