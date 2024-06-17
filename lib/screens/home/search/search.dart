import 'package:flutter/material.dart';
import 'package:graduation/screens/home/search/search_details.dart';
import 'package:graduation/screens/home/search/search_items.dart';

import '../../../core/network_layer/api_manager.dart';

class ItemSearch extends SearchDelegate<String> {
  // final items = ['shoes', 't-shirts', 'hats', 'jackets', 'Laptops'];
  // final suggItems = ['hats', 'Laptops'];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null.toString());
              } else {
                query = '';
                showSuggestions(context);
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null.toString()),
      icon: const Icon(Icons.arrow_back_outlined));

  @override
  Widget buildResults(BuildContext context) => FutureBuilder(
      future: Api_Manager.getSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(
              child: Text(
            snapshot.data?.message ?? snapshot.error.toString(),
            style: const TextStyle(color: Colors.black),
          ));
        }
        var searchList = snapshot.data?.data;
        return GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: searchList?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) => InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SearchDetails.routeName, arguments: searchList[index].id as num);
                },
                child: SearchItem(searchList![index])));
      });

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/auth_bg.png"),
                fit: BoxFit.fitWidth)));
    // final suggestions = query.isEmpty
    //     ? suggItems
    //     : items.where((item) {
    //         final itemLower = item.toLowerCase();
    //         final queryLower = query.toLowerCase();
    //         return itemLower.startsWith(queryLower);
    //       }).toList();
    // return buildSuggestionSuccess(suggestions);
  }

  // buildSuggestionSuccess(List<String> suggestions) => ListView.builder(
  //     itemBuilder: (context, index) {
  //       final suggestion = suggestions[index];
  //       return ListTile(
  //           onTap: () {
  //             query = suggestion;
  //             // close(context, suggestion);
  //             // showResults(context);
  //             Navigator.pushNamed(context, SearchView.routeName, arguments: suggestion);
  //           },
  //           title: Text(suggestion,
  //               style: const TextStyle(
  //                   fontFamily: "poppins",
  //                   fontSize: 18,
  //               color: Color(0xff2B3139))));
  //     },
  //     itemCount: suggestions.length);
  @override
  String get searchFieldLabel => 'What are you looking for?';
  @override
  TextStyle? get searchFieldStyle => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w200, fontFamily: "poppins");
}
