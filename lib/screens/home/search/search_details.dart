import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';

class SearchDetails extends StatelessWidget {
  static const String routeName = "SearchDetails";
  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.bottomRight, children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: const Image(image: AssetImage("assets/image/img.png")),
              ),
              const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Image(image: AssetImage("assets/image/Icon fav.png")))
            ]),
            Text('item name', style: theme.textTheme.bodyLarge),
            Text(
                'Lorem ipsum dolor sit amet, consectetur scing elit. Suspendisse, Curabitur vehicula tellus vel lorem commodo.',
                style: theme.textTheme.bodySmall),
            Text('address',
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
                  Text('EG 60,000', style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Buttons(
              title: " Add to cart",
              logo: "homecart.png",
              imgColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
