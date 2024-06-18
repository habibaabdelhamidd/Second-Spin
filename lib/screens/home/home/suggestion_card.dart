import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/screens/home/view_model/view_model.dart';
class SuggestionsCard extends StatefulWidget {
  Data product;
  HomeViewModel home_model;
  SuggestionsCard(this.product, this.home_model);

  @override
  State<SuggestionsCard> createState() => _SuggestionsCardState();
}

class _SuggestionsCardState extends State<SuggestionsCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(mediaQuery.width * 0.015),
      margin: EdgeInsets.all(mediaQuery.width * 0.01),
      width: mediaQuery.width / 2.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: mediaQuery.height * 0.2,
                child: Image.network(
                  widget.product.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 135,
                )),
            Text(
              widget.product.title!,
              style: theme.textTheme.bodyLarge,
              maxLines: 2,
            ),
            Text(
              "EGP ${widget.product.price!}",
              style: theme.textTheme.labelMedium,
            ),
            Text(widget.product.location!, style: theme.textTheme.bodyMedium),
            Row(
              children: [
                SizedBox(
                  width: mediaQuery.width / 3.5,
                ),
                GestureDetector(
                    onTap: () {
                      if (widget.product.isfav == false) {
                        widget.home_model.addtofav(widget.product.id!);
                        widget.product.isfav = !widget.product.isfav!;
                      } else {
                        widget.home_model.removeFromFav(widget.product.id!);
                        widget.product.isfav = !widget.product.isfav!;
                      }
                      setState(() {});
                    },
                    child: Image.asset(widget.product.isfav == false
                        ? "assets/image/Icon fav.png" : "assets/image/fav_icon_solid.png"))
              ],
            ),
          ]),
    );
  }
}
