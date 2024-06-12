import 'package:flutter/material.dart';
import 'package:graduation/screens/home/search/search_view.dart';

import '../../../core/network_layer/api_manager.dart';

class ItemSearch extends SearchDelegate<String> {
  final items = ['shoes', 't-shirts', 'hats', 'jackets', 'Laptops'];
  final suggItems = ['hats', 'Laptops'];

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
        var categoryList = snapshot.data?.data;
        return Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              padding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              itemCount: categoryList?.length ?? 0,
              itemBuilder: (context, index) =>SearchView()),
        );
      });

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? suggItems
        : items.where((item) {
            final itemLower = item.toLowerCase();
            final queryLower = query.toLowerCase();
            return itemLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionSuccess(suggestions);
  }

  buildSuggestionSuccess(List<String> suggestions) => ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
            onTap: () {
              query = suggestion;
              // close(context, suggestion);
              // showResults(context);
              Navigator.pushNamed(context, SearchView.routeName, arguments: suggestion);
            },
            title: Text(suggestion,
                style: const TextStyle(
                    fontFamily: "poppins",
                    fontSize: 18,
                color: Color(0xff2B3139))));
      },
      itemCount: suggestions.length);
  @override
  String get searchFieldLabel => 'What are you looking for?';
  @override
  TextStyle? get searchFieldStyle => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w200, fontFamily: "poppins");
}
