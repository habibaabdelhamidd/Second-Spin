import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/recycle_product_details/recycle_products_details.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_product_card.dart';
import 'package:graduation/screens/category/recycle/view_model/recycl_view_model.dart';
class RecycleViewProducts extends StatefulWidget {
  RecycleViewProducts({super.key});
  @override
  static const String routeName = "recycle_view_products";

  @override
  State<RecycleViewProducts> createState() => _RecycleViewProductsState();
}

class _RecycleViewProductsState extends State<RecycleViewProducts> {
  late AllRecyclViewModel recyclVm ;
  @override
  void initState() {
    super.initState();
    recyclVm = AllRecyclViewModel();
    futureRecycl();
  }
  Future<void> futureRecycl ()async{
    await recyclVm.getAllRecyclProducts();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Recycle",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: recyclVm.allRecyclProductsView == null ? Center(child: CircularProgressIndicator(),):
      Column(
        children: [
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: mediaquary.width*0.0016),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, Recycle_Product_Details.routeName,
                    arguments: recyclVm.allRecyclProductsView[index].id as int
                  );
                },
                child: Recycl_Product_card(
                    recyclVm.allRecyclProductsView[index],
                  recyclVm,
                ),
            ),
                itemCount: recyclVm.allRecyclProductsView.length,
          )),
        ],
      ),
    );
  }
}
