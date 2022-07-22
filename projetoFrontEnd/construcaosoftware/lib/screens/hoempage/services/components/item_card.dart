
import 'package:construcaosoftware/screens/hoempage/services/services.dart';
import 'package:flutter/material.dart';



class ItemCard extends StatelessWidget {
  final Product ? product;
  final VoidCallback ?press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press  ?? (){},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              
              decoration: BoxDecoration(
                color: product?.color ?? Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product?.id}",
                child: Image.asset(product!.image!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              product?.name?? '',
              style: const TextStyle(color:const Color(0xFFACACAC)),
            ),
          ),
          Text(
            "Matrícula ${product!.price!}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
