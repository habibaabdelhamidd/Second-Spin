import 'package:flutter/material.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/screens/login/buttons.dart';
import '../../../core/network_layer/api_manager.dart';

class SearchDetails extends StatefulWidget {
  static const String routeName = "SearchDetails";
  const SearchDetails({super.key});

  @override
  State<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  late ProductDetails details;
  @override
  void initState() {
    super.initState();
    details = ProductDetails();
  }
  Future<void> futureProductDetails(num? id )async{
    await details.getProductDetails(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    num? id = ModalRoute.of(context)?.settings.arguments as num?;
    futureProductDetails(id);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
        title: Text(
        "Product Details",
        style: theme.appBarTheme.titleTextStyle,
    ),
    ),
    body:  details.detailsData == null ? Center(child: CircularProgressIndicator(),): Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(alignment: Alignment.bottomRight, children: [
                      Container(
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(50)),
                        child: Image.network(
                          details.detailsData?.image??"",
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child:
                              Image(image: AssetImage("assets/image/Icon fav.png")))
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(details.detailsData?.title ?? "", style: theme.textTheme.bodyLarge),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(details.detailsData?.description ?? "", style: theme.textTheme.bodySmall),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ],
                ),
              ),
            ),
            Buttons(
              title: " Add to cart",
              logo: "homecart.png",
              imgColor: Colors.white,
              padd: 15,
            )
          ],
          ) ));

  }
}
class ProductDetails{
 DetailsData? detailsData;
  Future <void> getProductDetails(num? id) async{
    Api_Manager apiManager =  Api_Manager();
    detailsData = (await apiManager.getDetails(id));
  }
}