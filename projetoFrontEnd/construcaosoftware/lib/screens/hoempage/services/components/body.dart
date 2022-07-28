
import 'package:construcaosoftware/screens/hoempage/services/components/add_to_cart.dart';
import 'package:construcaosoftware/screens/hoempage/services/components/color_size.dart';
import 'package:construcaosoftware/screens/hoempage/services/components/counter_fav.dart';
import 'package:construcaosoftware/screens/hoempage/services/components/description.dart';
import 'package:construcaosoftware/screens/hoempage/services/components/product_title_with_image.dart';
import 'package:construcaosoftware/screens/hoempage/services/services.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  final Product ?product;
 
  const Body({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                   const   SizedBox(height: 20 / 2),
                      Description(product: product),
                    const  SizedBox(height: 20 / 2),
                    const  CounterWithFavBtn(),
                   const   SizedBox(height: 20 / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
