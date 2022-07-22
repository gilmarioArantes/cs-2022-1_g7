// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Product {
  final String? image, name, description;
  final num ?price, size, id;
  final Color? color;
  final String? customer_id;
  Product({
    this.id,
    this.image,
    this.customer_id,
    this.name,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> service = [
  Product(
      id: 1,
      name: "Paula",
      price: 187,
      size: 12,
      description: 'Delicada, charmosa e versátil, a nova bolsa feminina transversal Moleca 50007.1 é perfeita para momentos em que você só precisa carregar pequenos itens. O modelo é super estiloso, agregando originalidade e autenticidade ao seu look do dia.',
      image: "assets/images/aluna1.jpg",
      color: Colors.blueGrey),
  Product(
      id: 2,
      name: "Joao",
      price: 199,
      size: 8,
      description: 'A bolsa feminina transversal Moleca 50007.1 é confeccionada em material sintético, conta com alça transversal grossa; compartimento interno único que comporta itens como celular, cartões, dinheiro, batom e outros; e fechamento em zíper.',
      image: "assets/images/aluna2.jpg",
      color: Colors.blueGrey),

  Product(
      id: 3,
      name: "Marcio",
      price: 398,
      size: 8,
      description: 'Confeccionado em sintético, camurça ou verniz, dependendo da opção escolhida, todos de altíssima qualidade, forro têxtil super macio, confortável e resistente, o salto tem altura e largura que proporcionará longas horas de conforto e segurança, sem deixar de lado a elegância e versatilidade que tanto é prezada.',
      image: "assets/images/aluna3.jpg",
      color:  Colors.blueGrey),

   Product(
      id: 4,
      name: "Gustavo",
      price: 350,
      size: 8,
      description: 'O vestido é lindo, tecido grosso e modela bastante o corpo. A estampa é idêntica a da imagem, porém os botões não são dourados e grandes, são prateados e bem menores do que esse que aparece na imagem.',
      image: "assets/images/aluna4.jpg",
      color: Colors.blueGrey),

   Product(
      id: 5,
      name: "Maria",
      price: 134,
      size: 8,
      description: dummyText,
      image: "assets/images/aluna5.jpg",
      color: Colors.blueGrey),    
 
];

String dummyText =
    "Delicada, charmosa e versátil, a nova bolsa feminina transversal Moleca 50007.1 é perfeita para momentos em que você só precisa carregar pequenos itens. O modelo é super estiloso, agregando originalidade e autenticidade ao seu look do dia.";
