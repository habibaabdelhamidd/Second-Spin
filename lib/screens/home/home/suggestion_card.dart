import 'package:flutter/material.dart';
import 'package:graduation/models/home_model.dart';
class SuggestionsCard extends StatelessWidget{
  Data product ;
  SuggestionsCard(this.product, {super.key});
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
          ],),
        ],
      ),
    );
  }
}