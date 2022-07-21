import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>   with SingleTickerProviderStateMixin {
  TabController ? _tabController;

  List<String> categories = ['Para você', 'Popular', 'Promoções'];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(

        //INITIALINDEX QUAL PAGINA IRA CARREGAR PRIMEIRO
        length: 3,
        vsync: this,
        initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: const Text(''),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 118, 130),

                 Color.fromARGB(255, 211, 118, 130),
               // HexColor("#e20c84"),
              ],
            ),
          ),
        ),
        bottom: TabBar(
          indicatorWeight: 6.0,
          indicatorColor: Colors.pink[700],
          labelStyle:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          controller: _tabController,
          tabs: const <Widget>[
             Tab(
              text: 'Para você',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Lojas',
              icon: Icon(Icons.email),
            ),
            Tab(
              text: 'Promoções',
               icon: Icon(Icons.account_circle),
            ),
            Tab(
              text: 'Lojas',
               icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TelaParaVoce(),
            TelaParaVoce(),
              TelaParaVoce(),
                TelaParaVoce(),
                
          // TelaNovidades(),
          // TelaPerfil(),
          //ScreenStoreTab()
        ],
      ),
    );
  }
}
