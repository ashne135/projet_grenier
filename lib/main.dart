import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projet_grenier/splash.dart';
import 'package:projet_grenier/style/palette.dart';

void main() async {
  // Initialiser Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAqqIL2KXE-P2iWg75r9XCj03XdGoxJ0F0',
      appId: '1:141604177251:android:024810580ce7cf36ae3f56',
      messagingSenderId: '141604177251',
      projectId: 'projetgrenier-2ac38',
    ),
  );
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoneyTine',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Alberta",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            color: Palette.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Palette.primarySwatch,
        ).copyWith(
          secondary: Palette.appPrimaryColor,
        ),
      ),
      darkTheme: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(), // This is required
        ),
      ),
      home: const SplashCreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              style: Theme.of(context).textTheme.headline6,
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
