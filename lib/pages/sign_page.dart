import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdatabase2/models/user_models.dart';
import 'package:localdatabase2/service/db_service.dart';
class SignPage extends StatefulWidget {
  static final id = "sign_page";
  const SignPage({Key key}) : super(key: key);

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final adressController = TextEditingController();

  void _Login()async{
    String email=emailController.text.toString().trim();
    String number=numberController.text.toString().trim();
    String address=adressController.text.toString().trim();
    var userAccount=new User.from(email: email,number: number,address: address);
    HiveDB.storeAccount(userAccount);

    Map<String,dynamic> map1 = await HiveDB.loadAccount();
    var user2=new User.fromJsonAccount(map1);
    print(user2.email);
    print(user2.number);
    print(user2.address);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 127, 123,1),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 110,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Welcome',style: TextStyle(color: Color.fromRGBO(41, 168, 164, 1),fontSize: 20),),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 35),),
          ),
          SizedBox(height: 30,),
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

                      _fields(title: 'Email', text: 'Urmail@gmail.com', isPass:false,controller: emailController),
                      _fields(title: 'Number', text:'000-756-5475', isPass: false,controller: numberController),
                      _fields(title: 'Adress', text:'Golden tower, Sylhet', isPass: false,controller: adressController),




                      SizedBox(height: 30,),
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
                                      child: Text('Sign Up',style: TextStyle(color: Colors.grey[300],fontSize: 17),),
                                      onPressed: (){
                                        _Login();
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

                    ],
                  ),
                )
            ),
          ),

        ],
      ),
    );
  }
  Widget _fields({title,text,isPass,controller}){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5,),
            child: Text(title,style: GoogleFonts.poppins(fontSize: 17),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,color: Colors.grey[300]
                )
              )
            ),
            child: TextField(
              controller: controller,
              style: GoogleFonts.poppins(fontSize: 15),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                hintText: text,

              ),
            ),
          ),


        ],
      ),

    );
  }
}
