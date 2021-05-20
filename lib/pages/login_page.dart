import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdatabase2/models/user_models.dart';
import 'package:localdatabase2/pages/sign_page.dart';
import 'package:localdatabase2/service/db_service.dart';
class LoginPage extends StatefulWidget {
  static final id= "login_page";
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


final emailController = TextEditingController();
final passwordController = TextEditingController();

void _doLogin()async{
  String email=emailController.text.toString().trim();
  String pass=passwordController.text.toString().trim();
  var user=new User(email:email,password: pass);
  HiveDB.storeUser(user);


  Map<String,dynamic> map = await HiveDB.loadUser();
  var user1=new User.fromJsom(map);
  print(user1.email);
  print(user1.password);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 127, 123,1),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 90,left: 20),
            padding: EdgeInsets.only(),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/aa.jpeg')
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Welcome',style: TextStyle(color: Color.fromRGBO(41, 168, 164, 1),fontSize: 20),),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 35),),
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 7,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding:EdgeInsets.only(left: 40,right: 40,top:70),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.only(topRight:Radius.circular(40),topLeft: Radius.circular(40)),
                ),
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                       child:     Container(
                         padding:EdgeInsets.only(left: 5),
                         child:Text('Email',style: GoogleFonts.poppins(
                           color:Colors.black,
                           fontSize: 17,fontWeight: FontWeight.w500,
                         ),
                         ),
                       ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 2,color: Colors.grey[300]
                              ),
                            )
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration:InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border:InputBorder.none,
                            hintText:'Urmail@gmail.com',
                            hintStyle: GoogleFonts.poppins(
                              color:Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        width: double.infinity,
                        child:     Container(
                          padding:EdgeInsets.only(left: 5),
                          child:Text('Password',style: GoogleFonts.poppins(
                            color:Colors.black,
                            fontSize: 17,fontWeight: FontWeight.w500,
                          ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 2,color: Colors.grey[300]
                              ),
                            )
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration:InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border:InputBorder.none,
                            hintText:'Enter Password',
                            hintStyle: GoogleFonts.poppins(
                              color:Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('Forget Password?',style: TextStyle(color: Colors.grey[400]),),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 300,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Color.fromRGBO(7, 127, 123,1),
                                 ),
                                  child: Container(
                                    child: FlatButton(
                                      child: Text('Sign In',style: TextStyle(color: Colors.grey[300],fontSize: 17),),
                                      onPressed: (){
                                        Navigator.pushNamed(context, SignPage.id);
                                        _doLogin();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Text('OR',style: TextStyle(color: Colors.grey[300]),),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.facebookF,color: Colors.blueAccent,),
                                onPressed: (){},
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.twitter,color: Colors.lightBlueAccent,),
                                onPressed: (){},
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.instagram,color: Colors.black,),
                                onPressed: (){},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         Container(
                           padding: EdgeInsets.only(left: 65,),
                             child: Text('Dont\'t have an account ?',style: TextStyle(color: Colors.grey[500]),),
                           ),
                         GestureDetector(
                          child: Container(
                            child: Text('Sign Up',style: TextStyle(color: Colors.blueAccent),),
                        ),
                           onTap: (){},
                      ),
                    ],
                  )
                    ],
                  ),
                )
              ),
          ),

        ],
      ),
    );
  }

}
