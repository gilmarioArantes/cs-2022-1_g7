import 'package:construcaosoftware/screens/hoempage/services/components/details_screen.dart';
import 'package:construcaosoftware/screens/hoempage/services/components/item_card.dart';
import 'package:construcaosoftware/screens/hoempage/services/services.dart';
import 'package:flutter/material.dart';

class ServicesHome extends StatefulWidget {
  const ServicesHome({ Key? key }) : super(key: key);

  @override
  State<ServicesHome> createState() => _ServicesHomeState();
}

class _ServicesHomeState extends State<ServicesHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       
        Expanded(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.builder(
                itemCount: service.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(product: service[index], press: () => 
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: service[index],
                      ),
                    )),
                )
                ),
          ),
        ),
      ],
    );
  }
}