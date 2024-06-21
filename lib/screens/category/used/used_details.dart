import 'package:flutter/material.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/screens/login/buttons.dart';

import '../../../core/network_layer/api_manager.dart';
import '../../home/favourite/fav_details_vm.dart';

class UsedDetails extends StatefulWidget {
  static const String routeName = "UsedDetails";
  const UsedDetails({super.key});
  @override
  State<UsedDetails> createState() => _UsedDetailsState();
}

class _UsedDetailsState extends State<UsedDetails> {
  late ProductDetails details;
  late FavProductDetailsVm recylePVM ;

  @override
  void initState() {
    super.initState();
    details = ProductDetails();
    recylePVM = FavProductDetailsVm();
  }
  Future<void> futureProductDetails(num? id  )async{
    await details.getProductDetails(id);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    num? id = ModalRoute.of(context)!.settings.arguments as num?;
    futureProductDetails(id );
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: Expanded(
                  child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.network(
                                  details.detailsData?.image??"",
                                  width: double.infinity,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                               CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                  child: GestureDetector(
                                    onTap: ()async{
                                      print("click");
                                      print(details .detailsData?.isfav);
                                      if(details.detailsData?.isfav==false){
                                        // await details.addtofav();
                                        details.detailsData?.isfav=true;
                                      }else{
                                        // details.removeFromFav();
                                        details.detailsData?.isfav =false;
                                      }
                                      setState((){});
                                    },
                                      child: Image.asset(recylePVM.prodcuctData?.isfav==false ?
                                      "assets/image/Icon fav.png" : "assets/image/fav_icon_solid.png")
                                  )
                               ),
                            ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(details.detailsData?.title ?? "",
                            style: theme.textTheme.bodyLarge),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(details.detailsData?.description ?? "",
                            style: theme.textTheme.bodySmall),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(details.detailsData?.location ?? "",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffEFEEEE)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Price:', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                              Text("EGP ${details.detailsData?.price ?? ""}",
                                  style: theme.textTheme.bodyLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: ()async{
                        // if(details.detailsData?.incart==false){
                        //   await details.addtoCart();
                        //   details.detailsData?.incart=true;
                        // }
                        // else{
                        //   recylePVM.removeFromFav();
                        //   recylePVM.prodcuctData?.incart =false;
                        // }
                        // setState((){});
                      },
                      child: Buttons(
                        title: " Add to cart",
                        logo: "homecart.png",
                        imgColor: Colors.white,
                        padd: 15,
                      ),
                    )
                  ],
                ),
              ))
            );
  } }
  class ProductDetails{
    Api_Manager apiManager =  Api_Manager();
  DetailsData? detailsData;
  late FavProductDetailsVm recylePVM ;
  Future <void> getProductDetails(num? id) async{
    detailsData = (await apiManager.getDetails(id));
  }
  // Future<void> addtofav() async{
  //   await apiManager.addToFav(detailsData?.id!);
  // }
  // Future<void> addtoCart() async{
  //   await apiManager.addToCart(detailsData?.id!);
  // }
  // Future<void> removeFromFav ( )async{
  //   await apiManager.removeFromFav(detailsData?.id!);
  // }
}

