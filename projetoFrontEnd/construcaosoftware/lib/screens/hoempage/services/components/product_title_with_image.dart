
import 'package:construcaosoftware/screens/hoempage/services/services.dart';
import 'package:flutter/material.dart';


class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    @required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         const  Text(
            "Ótimo produto!",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product?.name?? '',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 20),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                   const TextSpan(text: "Preço\n"),
                    TextSpan(
                      text: "R\$${product!.price!}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          const    SizedBox(width: 20),
              Expanded(
                child: Hero(
                  tag: "${product!.id}",
                  child: Image.asset(
                    product!.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
