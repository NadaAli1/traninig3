import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart';
class LinksScreen extends StatefulWidget {
  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {

  SharedPreferences loginData;
  String username;
  @override
  void initState(){
    super.initState();
    initial();
  }
  void initial()async{
    loginData=await SharedPreferences.getInstance();
    setState(() {
      username=loginData.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    bool onpressedd=false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
          loginData.setBool('login', true);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }) ,
      ),
      body: Container(
        height: heightScreen,
        width: widthScreen,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Colors.black),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        onpressedd=false;
                      });
                    },
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:onpressedd==true?Colors.pink[900]:Colors.yellow,
                      ),
                      child: TextButton(
                        child: Text(
                          'Dart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                        onPressed: ()async{
                          const url='https://dart.dev';
                          if(await canLaunch(url)){
                            await launch(url);
                          }else{
                            print('con not launch $url');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Colors.black),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          onpressedd=false;
                        });
                      },
                      child: Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:onpressedd==true?Colors.pink[900]:Colors.yellow,
                        ),
                          child: TextButton(
                            child: Text(
                              'Flutter',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                              ),
                            ),
                            onPressed: ()async{
                             const url='https://flutter.dev';
                              if(await canLaunch(url)){
                                await launch(url);
                              }else{
                                print('con not launch $url');
                              }
                            },
                          ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}