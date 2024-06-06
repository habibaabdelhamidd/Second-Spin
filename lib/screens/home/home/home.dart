import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/screens/category/used/used_items.dart';
import 'package:graduation/screens/category/used/used_view.dart';
import 'package:graduation/screens/home/home/suggestion_card.dart';
import 'package:graduation/screens/home/search/search.dart';
import '../favourite/all_favourite_product.dart';
import '../view_model/view_model.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
 late HomeViewModel homeVm ;
  @override
  void initState() {
    super.initState();
    homeVm = HomeViewModel();
    futureSuggest();
  }
  Future<void> futureSuggest ()async{
   await homeVm.getSuggtionsModel();
   setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.07),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/image/Home background.png",
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(image: AssetImage("assets/image/homeLogo.png")),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, All_Favourit_Product.routeName);
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
              InkWell(
                onTap: () {
                  showSearch(context: context, delegate: ItemSearch());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme.colorScheme.onSecondary,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color(0xff7A7A7A),
                        size: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Text(
                        "What are you looking for?",
                        style: theme.textTheme.labelSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
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
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/image/slideshow1.jpg"),
                                    fit: BoxFit.fill),
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
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  children: [
                    Text(
                      "suggestions",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Container(
                height: mediaquary.height/3,
                child:ListView.builder(itemBuilder:
                (context , index)=> Suggestions_Card(
                  homeVm.suggestionsProducts[index]
                ),
                  itemCount: homeVm.suggestionsProducts.length,
                ),
              ),
            ],
          ),
        ));
  }
}
