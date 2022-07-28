import 'package:construcaosoftware/controller/services/init_services.dart';
import 'package:construcaosoftware/routes/routes_generator.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
       theme: ThemeData(
        primaryColor:const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color.fromARGB(255, 4, 125, 141),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
