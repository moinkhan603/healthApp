
import 'dart:convert';
import 'myfnts_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
//import 'package:geolocator/geolocator.dart';



class wlcm extends StatefulWidget {



  @override
  _wlcmState createState() => _wlcmState();
}
String mydate='';
String height;
String weight;
String gender='';
String height_f;
String weight_f;
String location='mororco';


class _wlcmState extends State<wlcm> {
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedinUser;

  bool _isSwitched=false;

  String _value = '';
  DateTime _date=DateTime.now();
  Future<Null>selectdate(BuildContext context)async{
    final DateTime picked= await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),

    );
    if(picked!=null&& picked!=_date)
    {
      setState(() {
        print(_date.toString());
        print(picked.day);
        print(picked.month);
        print(picked.year);
        mydate=picked.day.toString()+'/'+picked.month.toString()+'/'+picked.year.toString();
        _date=picked;
      });


    }


  }

  int _val = 0;
//
//  Position _currentPosition;
//  _getCurrentLocation() {
//    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//
//    geolocator
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//        .then((Position position) {
//      setState(() {
//        _currentPosition = position;
//      });
//    }).catchError((e) {
//      print(e);
//    });
//
//    print(_currentPosition.longitude);
//    print(_currentPosition.latitude);
//
//  }
//





  postTest() async {
    final uri = 'http://syscapital.com/api/listHealthresults/';
    var requestBody = {

      "userid":"111",
      "dob":mydate,
      "hight_value":height,
      "hight_format":height_f,
      "weight_value":weight,
      "weight_format":weight_f,
      "gender":gender,
      "location":location



    };



         http.Response response = await http.post(
           uri,
           body: json.encode(requestBody),
         );

         print(response.body);
         _showDialog();


  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,

          backgroundColor: Colors.lightBlue,

          title: Text('WELCOME',),
          elevation: 15,
          actions: <Widget>[

            IconButton(
              icon: Icon(Icons.account_circle,size: 35,),
              onPressed: (){
                _auth.signOut();
                Navigator.pop(context);
              },
            )


          ],

        ),
        backgroundColor: Color(0xffE3E3E3),
        //  padding: EdgeInsets.symmetric(horizontal: 20),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 30, 12,0),

            child: SafeArea(


              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12,0),

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),

                  ),
                  color: Colors.white70,
                  elevation: 10.0,
                  child:Container(
                    padding: EdgeInsets.all(10),

                    height: 550,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        SizedBox(height: 80,),

                        Text('Please fill the information'
                          ,style: TextStyle(fontSize: 35,color: Colors.deepPurple,
                              fontFamily: 'DancingScript'
                          ),

                        ),
                        SizedBox(height: 50,),
                        Divider(color: Colors.black,
                          height: 10,thickness: 1,indent: 2,endIndent: 2,),


                        //image())
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[

                            Text('DOB',style: TextStyle(fontSize: 22),),SizedBox(width: 50,),Text(mydate,
                              style: TextStyle(fontSize: 20),
                            ),

                            IconButton(icon: Icon(Icons.date_range,size: 40,color: Colors.blue,), onPressed: () {

                              selectdate(context);


                            },),

                          ],),

                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text('Height',style: TextStyle(fontSize: 22),),
                            SizedBox(width: 150,),
                            Expanded(
                              child: Material(

                                elevation: 8.0,
                                color: Colors.white70,
                                // borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: new TextField(
                                 onChanged: (String value)
                                  {
                                    height=value;
                                  },
                                  textAlign: TextAlign.center,


                                  decoration: InputDecoration(



                                    hintText: "6 feet",),
                                ),

                              ),

                            ),
                            Expanded(
                              child: Material(

                                elevation: 8.0,
                                color: Colors.white70,
                                // borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: new TextField(
                                 onChanged: (String value)
                                  {
                                    height_f=value;
                                  },
                                  textAlign: TextAlign.center,


                                  decoration: InputDecoration(



                                    hintText: "cm/in",),
                                ),

                              ),

                            ),







                          ],),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text('Weight',style: TextStyle(fontSize: 22),),
                            SizedBox(width: 148,),
                            Expanded(
                              child: Material(

                                elevation: 8.0,
                                color: Colors.white70,
                                // borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: new TextField(
                                  onChanged: (String value)
                                  {
                                    weight=value;
                                  },
                                  textAlign: TextAlign.center,


                                  decoration: InputDecoration(



                                    hintText: "50kg",),
                                ),

                              ),

                            ),
                            Expanded(
                              child: Material(

                                elevation: 8.0,
                                color: Colors.white70,
                                // borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: new TextField(
                                  onChanged: (String value)
                                  {
                                    weight_f=value;
                                  },
                                  textAlign: TextAlign.center,


                                  decoration: InputDecoration(



                                    hintText: "kg/lb",),
                                ),

                              ),

                            ),

                          ],),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text('Gender',style: TextStyle(fontSize: 22),),SizedBox(width: 10,),
                            //////

                            GestureDetector(
                              onTap: () => setState(() { _val = 0;
                              gender='male';
                              }),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  color: _val == 0 ? Colors.grey : Colors.transparent,
                                  child: Icon(Myfnts.male,)
                              ),
                            ),

                            GestureDetector(
                              onTap: () => setState(() { _val = 1;

                              gender='female';

                              }),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: _val == 1 ? Colors.grey : Colors.transparent,
                                child: Icon(Myfnts.female,),
                              ),
                            ),








/////////////////////////////
                          ],),
                        SizedBox(height: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text('Location',style: TextStyle(fontSize: 20),),SizedBox(width: 10,),
                            Switch(activeColor: Colors.lightBlue,
                              onChanged: (val) => setState(()
                              {
                                _isSwitched = val;

                                if(_isSwitched==true)
                                {
                                //  _getCurrentLocation();
                                }
                              }

                                //=> _isSwitched = val

                              ),
                              value: _isSwitched,

                            ),






                          ],),



                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  color: Colors.lightBlue),
                              child: FlatButton(

                                child: Text(
                                  "Send Data",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                onPressed: ()
                                {
                                  if(height==null||weight==null||weight_f==null||height_f==null)
                                  {
                                    Toast.show(
                                        "feilds cannot be empty",

                                        context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor:Colors.red);

                                  }
                                  else {
                                    postTest();
                                  }
                                },
                              ),
                            ))











                      ],),),

                ),
              ),
            ),
          ),
        )
    );
  }


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Congratulations.."),
          content: new Text("Data has sent to the server"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),







          ],
        );
      },
    );



    print(height);
    print(weight);
    print(mydate);
    print(gender);
  }





}
