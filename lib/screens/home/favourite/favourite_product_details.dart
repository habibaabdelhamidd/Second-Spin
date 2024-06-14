import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../category/recycle/view_model/recycle_product_details_vm.dart';

class Favourite_product_details extends StatefulWidget {
  @override
  static const String routeName = "favourite product details";

  @override
  State<Favourite_product_details> createState() => _Favourite_product_detailsState();
}

class _Favourite_product_detailsState extends State<Favourite_product_details> {
  late RecycleProductDetailsVm recylePVM ;
  @override
  void initState() {
    super.initState();
    recylePVM = RecycleProductDetailsVm();
  }
  @override
  Future<void> futureProductData(int id )async{
    await recylePVM.getProductData(id);
    setState(() {});
  }
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    int id = ModalRoute.of(context)!.settings.arguments as int;
    futureProductData(id);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Product details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(mediaquary.width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.network(
                    recylePVM.prodcuctData?.image?? "",
                    width: mediaquary.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          right: mediaquary.width * 0.02,
                          bottom: mediaquary.width * 0.02),
                      padding: EdgeInsets.all(mediaquary.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/image/fav_icon_solid.png",
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaquary.width * 0.02,
                    bottom: mediaquary.width * 0.01),
                child: Text(
                  recylePVM.prodcuctData?.title??"",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Text(
                  recylePVM.prodcuctData?.description??"",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xffA7A7A7))),
              Text(recylePVM.prodcuctData?.location??"", style: theme.textTheme.bodyMedium),
              Container(
                padding: EdgeInsets.all(mediaquary.width * 0.05),
                margin: EdgeInsets.symmetric(
                    vertical: mediaquary.width * 0.02,
                    horizontal: mediaquary.width * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEFEEEE),
                ),
                child: Row(
                  children: [
                    Text(
                      "Price:",
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: mediaquary.width / 3.5,
                    ),
                    Text(
                      recylePVM.prodcuctData?.price??"",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaquary.height / 7,
              ),
              Container(
                padding: EdgeInsets.all(mediaquary.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.10),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(mediaquary.width * 0.03),
                  margin: EdgeInsets.all(mediaquary.width * 0.02),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/image/homecart.png"),
                        color: Colors.white,
                        size: 30,
                      ),
                      Text("Add to cart",
                          style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
