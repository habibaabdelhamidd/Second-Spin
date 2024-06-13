import 'package:flutter/material.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/models/search_response/Data.dart';
import 'package:graduation/screens/login/buttons.dart';
import '../../../core/network_layer/api_manager.dart';

class SearchDetails extends StatelessWidget {
  static const String routeName = "SearchDetails";
  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var details = ModalRoute.of(context)?.settings.arguments as SearchData;
    return
        // FutureBuilder(
        //     future: Api_Manager.getDetails(details.id),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //             child: CircularProgressIndicator(
        //           color: Colors.black,
        //         ));
        //       }
        //       if (snapshot.hasError || snapshot.data == null) {
        //         return Center(
        //             child: Text(
        //           snapshot.data?.message ?? snapshot.error.toString(),
        //           style: const TextStyle(color: Colors.black),
        //         ));
        //       }
        //       return
        Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Image.network(
                      details.image!,
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
                Text(details.title ?? "", style: theme.textTheme.bodyLarge),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(details.title ?? "", style: theme.textTheme.bodySmall),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(details.location ?? "",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Price:', style: theme.textTheme.bodyLarge),
                      Text(details.price ?? "",
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ],
            ),
            Buttons(
              title: " Add to cart",
              logo: "homecart.png",
              imgColor: Colors.white,
              padd: 15,
            )
          ],
        ),
      ),
    );
    //       });
  }
}
