import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggestions_Card extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      width:mediaquary.width/2.6,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Image.asset("assets/image/black_lap.png" , fit: BoxFit.fill,),
          Text("Apple MacBook Pro 13" , style: theme.textTheme.bodyLarge,),
          Text("16,500 EG" , style: theme.textTheme.bodyLarge,),
          Text("Madinaty, Egypt" , style: theme.textTheme.bodyMedium),
          Row(children: [
            SizedBox(width: mediaquary.width/3.5,),
            ImageIcon(AssetImage("assets/image/Icon fav.png" ,),color: theme.primaryColor,)
          ],),
        ],
      ),
    );
  }

}