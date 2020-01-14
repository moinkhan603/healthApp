import 'package:flutter/material.dart';
import 'welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';



class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool showSpinner=false;
  String email;
  String password;
  String password2;
  final _auth=FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 45,),
              Image.asset('assets/images/logos.jpg'),
Text("SIGN UP HERE",style: TextStyle(fontSize: 42,fontWeight:FontWeight.bold,
fontFamily: 'DancingScript',color: Colors.blueAccent
),),
              SizedBox(height: 50),

              Padding(

                padding: EdgeInsets.symmetric(horizontal: 32 ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    onChanged: (String value){
                      email=value.trim();

                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    obscureText: true,
                    onChanged: (String value){
                      password=value.trim();

                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    obscureText: true,
                    onChanged: (String value){
                      password2=value.trim();

                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xff1E90FF)),
                    child: FlatButton(

                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      onPressed: ()async {


                        if(password==password2&&password!=null&&email!=null) {
                          setState(() {
                            showSpinner = true;
                          });

                          try {

                            print('heloooo');
                            final newuser = await _auth
                                .createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newuser != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => wlcm()),
                              );
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                          catch (e) {
                            print(e);
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                        else{

                          //dialouge shows that pass dont match
                          Toast.show(
                          "Password donot match",

                          context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor:Colors.red);



                        }






                      },
                    ),
                  )),




            ],

          ),
        ),
      ),



    );
  }
}
