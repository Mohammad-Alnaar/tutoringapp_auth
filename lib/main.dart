//import 'package:connect_firebase/app/config/routes/router.dart';
//import 'package:connect_firebase/app/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        // routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: "Tutor",
        themeMode: ThemeMode.light,
        //theme: MyTheme.lightTheme,
        //localizationsDelegates: AppLocalizations.localizationsDelegates,
        //  supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en')
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
    // rootNavigatorKey.currentState!.context.go("/");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Center(
              // child: ,

              ),

          //  floatingActionButton: FloatingActionButton(
          //    onPressed: _incrementCounter,
          //    tooltip: 'Increment',
          //    child: const Icon(Icons.add),
          //  )
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
