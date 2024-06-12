import 'package:flutter/material.dart';
import 'package:graduation/models/categories_response/category_data.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/screens/login/buttons.dart';
import '../../../core/network_layer/api_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UsedDetails extends StatelessWidget {
  static const String routeName = "UsedDetails";
  const UsedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as CategoryData;
    return
      Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: FutureBuilder(
          future: Api_Manager.getCategory(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
            }
            if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                  child: Text(
                    "error",
                    style: TextStyle(color: Colors.white),
                  ));
            }
            return Expanded(
                child:  Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(50)),
                          child: CachedNetworkImage(
                            height: 300,
                            width: 240,
                            imageUrl: "https://image.tmdb.org/t/p/w500${args.image}",
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        const CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Image(image: AssetImage("assets/image/Icon fav.png")))
                      ]),
                      Text(args.title??"", style: theme.textTheme.bodyLarge),
                      // Text(
                      //     args.story,
                      //     style: theme.textTheme.bodySmall),
                      Text(args.location??"",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.normal)),
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
                            Text(args.price??"", style: theme.textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SizedBox(

                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Buttons(
                        title: " Add to cart",
                        logo: "homecart.png",
                        imgColor: Colors.white, padd: 15,

                      )
                    ],
                  ),
                ),);
          })
    );
  }
}
