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
  late FavProductDetailsVm favPVM ;
  @override
  void initState() {
    super.initState();
    favPVM = FavProductDetailsVm();
    int ? id ;
    WidgetsBinding.instance.addPostFrameCallback((_){
      id = ModalRoute.of(context)!.settings.arguments as int;
      futureProductData(id!);
    });
  }
  Future<void> futureProductData(int id )async{
    await favPVM.getProductData(id);
    favPVM.prodcuctData!.isfav = true;
    print(favPVM.prodcuctData?.isfav);
    setState(() {});
  }
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Product details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body:favPVM.prodcuctData == null ? Center(child: CircularProgressIndicator(),):
      Container(
        padding: EdgeInsets.all(mediaquary.width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.network(
                    favPVM.prodcuctData?.image?? "",
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
                      child:GestureDetector(
                          onTap: ()async{
                            print(favPVM .prodcuctData!.isfav);
                            if(favPVM.prodcuctData?.isfav==false){
                              await favPVM.addtofav();
                              favPVM.prodcuctData?.isfav=true;
                            }
                            else{
                              favPVM.removeFromFav();
                              favPVM.prodcuctData?.isfav =false;
                            }
                            setState((){});
                          },
                          child: Image.asset(favPVM.prodcuctData?.isfav==false ?
                          "assets/image/Icon fav.png" : "assets/image/fav_icon_solid.png")
                      )
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaquary.width * 0.02,
                    bottom: mediaquary.width * 0.01),
                child: Text(
                  favPVM.prodcuctData?.title??"",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Text(
                  favPVM.prodcuctData?.description??"",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xffA7A7A7))),
              Text(favPVM.prodcuctData?.location??"", style: theme.textTheme.bodyMedium),
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
                      favPVM.prodcuctData?.price??"",
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
                child: GestureDetector(
                  onTap: ()async{
                    if(favPVM.prodcuctData?.incart==false){
                      await favPVM.addtoCart();
                      favPVM.prodcuctData?.incart=true;
                    }
                    setState((){});
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
