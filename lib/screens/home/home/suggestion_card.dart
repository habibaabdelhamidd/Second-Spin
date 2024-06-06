import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/screens/home/view_model/view_model.dart';
class Suggestions_Card extends StatelessWidget{
  Data product ;
  Suggestions_Card(this.product);
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
          Image.network(product.image!,fit: BoxFit.fill, ),
          Text(product.title!,style: theme.textTheme.bodyLarge),
          Text(product.price!, style: theme.textTheme.bodyLarge,),
          Text(product.location!, style: theme.textTheme.bodyLarge,),
          Row(children: [
            SizedBox(width: mediaquary.width/3.5,),
            ImageIcon(AssetImage("assets/image/Icon fav.png" ,),color: theme.primaryColor,)
          ],),
        ],
      ),
    );
  }
}