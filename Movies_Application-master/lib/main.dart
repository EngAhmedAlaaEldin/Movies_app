import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/screens/category_list_screen/category_list_screen.dart';
import 'package:movie_application/screens/home_screen.dart';
import 'package:movie_application/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movie_application/splash_screen.dart';
import 'package:movie_application/themes/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen2Sub.routeName,
      routes: {
        SplashScreen2Sub.routeName: (_) => SplashScreen2Sub(),
        HomeScreen.routeName: (_) => HomeScreen(),
        MovieDetScreen.routeName: (_) => MovieDetScreen(),
        CategoryListScreen.routeName: (_) => CategoryListScreen()
      },
      theme: MyThemeData.appTheme,
    );
  }
}
