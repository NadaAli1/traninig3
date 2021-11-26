//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traninig3/flutter_dart_screen.dart';

class  LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  SharedPreferences loginData;

  bool newuser;

  bool ispassword=true;

  @override
  void initState(){
    super.initState();
    check_if_already_login();
  }

  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.all(55),
          child: Text('LOGIN',style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w800,
          ),
            //textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        width:widthScreen ,
        height: heightScreen,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/flutter.png'),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'E-Mail Address'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter your e-mail address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: ispassword==true?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                        labelText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: ispassword,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),SizedBox(height: 120,),
                  TextButton(
                     child: Text('LOGIN NOW',
                     style: TextStyle(
                       color: Colors.deepOrange,
                       fontWeight: FontWeight.w300,
                       fontSize: 30,
                     ),
                     ),
                    onPressed: ()async{
                       String userName=emailController.text;
                       String userPass=passwordController.text;
                       if(userName!=''&&userPass!=''){
                         print('successful');
                         loginData.setBool('login', false);
                         loginData.setString('username', userName);
                         Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context)=>LinksScreen()));
                       }
                        if(formkey.currentState.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (
                              context) => LinksScreen()));
                        }
                    },
                   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void check_if_already_login()async{
    loginData = await SharedPreferences.getInstance();
    newuser=(loginData.getBool('login')??true);
    print(newuser);

    if(newuser==false){
      CircularProgressIndicator();
     Navigator.push(context,new MaterialPageRoute(builder: (context)=>LinksScreen()));
    }
  }

  @override
  void disPose() {
    emailController.dispose();
    passwordController.dispose();
   // super.disPose();
  }
}
