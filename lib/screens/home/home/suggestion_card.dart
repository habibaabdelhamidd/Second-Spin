import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/screens/home/view_model/view_model.dart';
class Suggestions_Card extends StatefulWidget{
  Data product ;
  HomeViewModel home_model ;
  Suggestions_Card(this.product  , this.home_model);

  @override
  State<Suggestions_Card> createState() => _Suggestions_CardState();
}

class _Suggestions_CardState extends State<Suggestions_Card> {
  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(mediaquary.width*0.015),
      margin: EdgeInsets.all(mediaquary.width * 0.01),
      width:mediaquary.width/2.6,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: mediaquary.height*0.2,
              child: Image.network(widget.product.image!,fit: BoxFit.cover, )),
          Text(widget.product.title!,style: theme.textTheme.bodyMedium),
          Text(widget.product.price!, style: theme.textTheme.bodyLarge,),
          Text(widget.product.location!, style: theme.textTheme.bodyLarge,),
          Row(children: [
            SizedBox(width: mediaquary.width/3.5,),
            GestureDetector(
              onTap: (){
                if(widget.product.isfav==false){
                  widget.home_model.addtofav(widget.product.id!);
                  widget.product.isfav = !widget.product.isfav!;
                }else{
                  widget.home_model.removeFromFav(widget.product.id!);
                  widget.product.isfav =!widget.product.isfav!;
                }
                setState((){});
              },
                child: Image.asset(widget.product.isfav==false ?
                "assets/image/Icon fav.png" : "assets/image/fav_icon_solid.png")
            )
          ],),
        ],
      ),
    );
  }
}