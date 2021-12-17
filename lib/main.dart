import 'package:app_commerce/screens/cart_screen.dart';
import 'package:app_commerce/screens/check_out.dart';
import 'package:app_commerce/screens/detail_screen.dart';
import 'package:app_commerce/screens/home_page.dart';
import 'package:app_commerce/screens/list_product.dart';
import 'package:app_commerce/screens/login_screen.dart';
import 'package:app_commerce/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}


class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapShot){
         if(snapShot.hasData){
           return HomePage();
         } else{
           return LoginScreen();
         }
        }
      ),
    );
  }
}

