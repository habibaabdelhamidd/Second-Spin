import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/home/favourite/all_favourit_product.dart';
import 'package:graduation/screens/login/text_ff.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onBackground,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/Home background.png"),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.07),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(image: AssetImage("assets/image/homeLogo.png")),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, All_Favourit_Product
                            .routeName);
                      },
                      child: CircleAvatar(
                        backgroundColor: theme.colorScheme.onSecondary,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: theme.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     color: theme.colorScheme.onSecondary,
                //   ),
                //   alignment: Alignment.center,
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.symmetric(
                //           vertical: 10.0, horizontal: 10),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             const BorderSide(color: Colors.grey, width: 1),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       hintText: "What are you looking for?",
                //       hintStyle: theme.textTheme.labelSmall,
                //       suffixIcon: const Icon(Icons.search),
                //     ),
                //   ),
                // )
                InkWell(
                  child: TextF(
                    hint: "What are you looking for?",
                    astrik: false,
                    fieldColor: theme.colorScheme.onSecondary,
                    icon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                CarouselSlider(
                    items: [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/image/slideshow1.jpg"),fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Donate now',
                                style: theme.textTheme.titleLarge,
                              ));
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      // autoPlay: true,
                      // autoPlayInterval: const Duration(seconds: 3),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
