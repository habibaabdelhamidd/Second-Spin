import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/recyle/all_recycle_model.dart';

import '../view_model/recycl_view_model.dart';

class Recycl_Product_card extends StatefulWidget {
  AllRecycle productRecycl  ;
  AllRecyclViewModel allRecyclViewModel ;
  Recycl_Product_card(this.productRecycl , this.allRecyclViewModel);

  @override
  State<Recycl_Product_card> createState() => _Recycl_Product_cardState();
}

class _Recycl_Product_cardState extends State<Recycl_Product_card> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(mediaquary.width * 0.015),
      margin: EdgeInsets.all(mediaquary.width * 0.01),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: mediaquary.height * 0.2,
            child: Image.network(
              widget.productRecycl.image!,
              width: mediaquary.width / 2.2,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.productRecycl.title!,
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            widget.productRecycl.price!,
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            widget.productRecycl.location!,
            style: theme.textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: (){
                    if(widget.productRecycl.isfav==false){
                      widget.allRecyclViewModel.addtofav(widget.productRecycl.id!);
                      widget.productRecycl.isfav = !widget.productRecycl.isfav!;
                    }else{
                      widget.allRecyclViewModel.removeFromFav(widget.productRecycl.id!);
                      widget.productRecycl.isfav =!widget.productRecycl.isfav!;
                    }
                    setState((){});
                  },
                  child: Image.asset(widget.productRecycl.isfav==false ?
                  "assets/image/Icon fav.png" : "assets/image/fav_icon_solid.png")
              ),
            ],
          ),
        ],
      ),
    );
  }
}
