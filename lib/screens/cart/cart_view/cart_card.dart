import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/cart/vms/cart_list_view_model.dart';
import '../../../models/cart/cart_list_model.dart';
class CartCard extends StatelessWidget{
  CartList cartProduct ;
  CartListViewModel cartM;
  CartCard(this.cartProduct , this.cartM);
  @override
  Widget build(BuildContext context) {
    final mediaquary =MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(mediaquary.width * 0.006),
          margin: EdgeInsets.all(mediaquary.width * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color(0xffCCCCCC),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: mediaquary.width*0.3,
                  child: Image.network(cartProduct.image!)),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaquary.width * 0.02,
                    left: mediaquary.width * 0.03,
                    bottom: mediaquary.width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       cartProduct .title!,
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "EGP ${cartProduct.price}",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "${cartProduct.location} Egypt",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.grey.shade500,
                      size: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}