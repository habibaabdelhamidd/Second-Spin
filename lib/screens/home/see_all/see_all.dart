import 'package:flutter/material.dart';
import 'package:graduation/screens/home/see_all/see_details.dart';
import '../home/suggestion_card.dart';
import '../view_model/view_model.dart';

class SeeAll extends StatefulWidget {
  static const String routeName = "SeeAll";
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  late HomeViewModel homeVm;
  @override
  void initState() {
    super.initState();
    homeVm = HomeViewModel();
    futureSuggest();
  }

  Future<void> futureSuggest() async {
    await homeVm.getSuggtionsModel();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var args = ModalRoute.of(context)?.settings.arguments as Data;
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "All items",
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: homeVm.suggestionsProducts.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AllDetails.routeName,
                                arguments:  homeVm.suggestionsProducts[index].id as int);
                          },
                          child: SuggestionsCard(
                            homeVm.suggestionsProducts[index] ,
                            homeVm,
                          ),)))
           );
  }
}