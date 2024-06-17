import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
class SuggestionsCard extends StatelessWidget{
  Data product ;
  SuggestionsCard(this.product, {super.key});
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
    final mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(mediaQuery.width*0.015),
      margin: EdgeInsets.all(mediaQuery.width * 0.01),
      width:mediaQuery.width/2.4,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: mediaQuery.height*0.2,
              child: Image.network(product.image!,fit: BoxFit.cover,width: double.infinity ,height: 135, )),
          Text(product.title!,style: theme.textTheme.bodyLarge,maxLines: 2,),
          Text("EGP ${product.price!}", style: theme.textTheme.labelMedium,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(product.location!, style: theme.textTheme.bodyMedium),
            ImageIcon(AssetImage("assets/image/Icon fav.png" ,),color: theme.primaryColor,)
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