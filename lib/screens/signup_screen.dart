import 'package:app_commerce/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String gmail;
late String password;
bool obserText = true;
class _SignUpScreenState extends State<SignUpScreen> {
  void vaildation() async {
    final FormState? _form = _formKey.currentState;
    if(_form!.validate()){
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: gmail, password: password);
      }on PlatformException catch (e) {
        print(e.message.toString());
      }
    } else{}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
           child: Column(
             children: [
               Image.asset(
             "images/bg_regis.png",
             height: 150,
             ),
            Container(
              height: 500,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   TextFormField(
               decoration: InputDecoration(
                 hintText: "Họ và tên",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
             ),
               TextFormField(
                 onChanged: (value){
                   setState(() {
                     gmail = value;
                     print(gmail);
                   });
                 },
                
               decoration: InputDecoration(
                 hintText: "Gmail",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
             ),
               TextFormField(
                 obscureText: obserText,
                 onChanged: (value){
                   setState(() {
                     password = value;

                   });
                 },
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
                     Icons.visibility
                   ),
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
             ),
              
              Container(
               height: 50,
               width: 150,
               child: RaisedButton(
                 onPressed: (){
                   vaildation();
                 },
                 child: Text(
                   'Đăng ký',
                   style: TextStyle(
                     color: Color(0xff000000),
                     fontSize: 20
                   ),
                 ),
                 color: Color(0xffD8B6A4),
                 ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:8.0),
               child: Row(
                 children: [
                   Text(
                     'Tôi đã có tài khoản',
                     style: TextStyle(
                       fontSize: 15
                     ),
                   ),
                   SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => LoginScreen())
                      );
                    },
                    child:  Text(
                     'Đăng nhập',
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.blue
                     ),
                   ),
                  )
                 ],
               ),
             )
                ],
              ),
            ),
            
             ],
           )
          ),
        ),
        ],
      ),
    );
  }
}