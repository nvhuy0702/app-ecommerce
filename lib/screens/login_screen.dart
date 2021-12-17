import 'package:app_commerce/screens/signup_screen.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
bool obserText = true;
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("images/bg_login.png", height: 150,),
                      TextFormField(
                     decoration: InputDecoration(
                       hintText: "Gmail",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                   ),
                   
                    TextFormField(
                       obscureText: obserText,
                     decoration: InputDecoration(
                       hintText: "Mật khẩu",
                       suffixIcon: GestureDetector(
                         onTap: (){
                           setState(() {
                             obserText = !obserText;
                           });
                           FocusScope.of(context).unfocus();
                         },
                         child: Icon(
                           obserText == true? Icons.visibility: Icons.visibility_off,
                         ),
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                   ),
                   SizedBox(height: 10,),
                  Container(
                      height: 50,
                   width: 150,
                     child: RaisedButton(
                       color: Color(0xffD8B6A4),
                       onPressed:(){},
                       child: GestureDetector(
                         child: Text(
                           'Đăng nhập',
                           style: TextStyle(
                             color: Color(0xff000000),
                             fontSize: 20
                           ),
                         ),
                       ), 
                       ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         child: Text(
                           'Chưa có tài khoản?',
                           style: TextStyle(
                             fontSize: 15
                           ),
                         ),
                       ),
                       GestureDetector(
                         onTap: (){
                           Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: (ctx) => SignUpScreen()),
                           );
                         },
                         child: Text(
                           'Đăng ký',
                           style: TextStyle(
                             color: Colors.blue,
                             fontSize: 18
                           )
                         ),
                       )
                     ],
                   )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}