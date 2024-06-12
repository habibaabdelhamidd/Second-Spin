import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/view_model/recycle_product_details_vm.dart';
class Recycle_Product_Details extends StatefulWidget {
  @override
  static const String routeName = "Recycle_Product_Details";
  Recycle_Product_Details({super.key});

  @override
  State<Recycle_Product_Details> createState() => _Recycle_Product_DetailsState();
}

class _Recycle_Product_DetailsState extends State<Recycle_Product_Details> {
  late RecycleProductDetailsVm recylePVM ;
  @override
  void initState() {
    super.initState();
    recylePVM = RecycleProductDetailsVm();
    futureProductData();
  }
  Future<void> futureProductData()async{
    await recylePVM.getProductData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Product Details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(mediaquery.width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        recylePVM.prodcuctData?.image ?? "" ,
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          right: mediaquery.width * 0.05,
                          bottom: mediaquery.width * 0.02),
                      padding: EdgeInsets.all(mediaquery.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/image/Icon fav.png",
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: mediaquery.width * 0.0),
                child: Text(recylePVM.prodcuctData?.title??"",
                    style: theme.textTheme.bodyLarge),
              ),
              Text(
                  recylePVM.prodcuctData?.description?? "",
                  style: theme.textTheme.bodySmall),
              Text(
                recylePVM.prodcuctData?.location ?? "",
                style: theme.textTheme.bodyMedium,
              ),
              Container(
                padding: EdgeInsets.all(mediaquery.width * 0.05),
                margin: EdgeInsets.symmetric(
                    vertical: mediaquery.width * 0.02,
                    horizontal: mediaquery.width * 0.01),
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
                      width: mediaquery.width / 3.5,
                    ),
                    Text(
                      recylePVM.prodcuctData?.price ?? "",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaquery.height / 10,
              ),
              Container(
                padding: EdgeInsets.all(mediaquery.width * 0.02),
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
                  padding: EdgeInsets.all(mediaquery.width * 0.03),
                  margin: EdgeInsets.all(mediaquery.width * 0.02),
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
