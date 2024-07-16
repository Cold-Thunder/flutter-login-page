import 'package:flutter/material.dart';
import 'package:login_page/activites/splashScreen.dart';
import 'package:login_page/providers/change_show_icon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create)=>ChangeShowIcon())
      ],
        child: MaterialApp(
          title: 'Login Form',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Splashscreen(),
        )
    );
  }
}



