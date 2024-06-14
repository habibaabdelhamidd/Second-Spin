import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/home/favourite/add_to_fav_view_model.dart';
import 'package:graduation/screens/home/favourite/favourite_product_details.dart';
import '../../category/recycle/view_model/recycl_view_model.dart';
import 'favourite_card.dart';
class All_Favourit_Product extends StatefulWidget {
  @override
  static const String routeName = "all_favourit";

  @override
  State<All_Favourit_Product> createState() => _All_Favourit_ProductState();
}
class _All_Favourit_ProductState extends State<All_Favourit_Product> {
  late AddToFavViewModel favVM ;
  @override
  void initState() {
    super.initState();
    favVM = AddToFavViewModel();
    futureFavProduct();
  }
  Future<void> futureFavProduct ()async{
    await favVM.getAllFavProducts();
    setState(() {});
  }
@override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Favorites",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: mediaquary.width*0.0016),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Favourite_product_details.routeName
                        ,arguments: favVM.allFavProducts[index].product_id as int
                        );
                      },
                      child: Favourite_card(
                          favVM.allFavProducts[index]
                      ),
                  ),
                itemCount: favVM.allFavProducts.length,
                  ))
        ],
      ),
    );
  }
}
