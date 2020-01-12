
import 'myfnts_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class wlcm extends StatefulWidget {



  @override
  _wlcmState createState() => _wlcmState();
}
String mydate='';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(centerTitle: true,

  backgroundColor: Colors.black54,
  
  title: Text('WELCOME',),
  elevation: 15,
  actions: <Widget>[

    IconButton(
      icon: Icon(Icons.person_outline,size: 35,),
      onPressed: (){
        _auth.signOut();
        Navigator.pop(context);
      },
    )


  ],

),
backgroundColor: Color(0xffFFFFE0),
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

                      IconButton(icon: Icon(Icons.date_range,size: 40,color: Colors.red,), onPressed: () {

                      selectdate(context);


                      },),

                  ],),

                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    Text('Height',style: TextStyle(fontSize: 22),),SizedBox(width: 10,),
                      Text('12cm',style: TextStyle(fontSize: 20),)
                  ],),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    Text('Weight',style: TextStyle(fontSize: 22),),SizedBox(width: 10,),Text('45KG',

                    style: TextStyle(fontSize: 20),
                      ),

                  ],),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    Text('Gender',style: TextStyle(fontSize: 22),),SizedBox(width: 10,),
                  //////

                      GestureDetector(
                        onTap: () => setState(() => _val = 0),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: _val == 0 ? Colors.grey : Colors.transparent,
                          child: Icon(Myfnts.male,)
                        ),
                      ),

                      GestureDetector(
                        onTap: () => setState(() => _val = 1),
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

                    Text('Location',style: TextStyle(fontSize: 25),),SizedBox(width: 10,),
                      Switch(activeColor: Colors.red,
                        onChanged: (val) => setState(() => _isSwitched = val
                        ),
                        value: _isSwitched,

                      ),




                  ],),

              ],),),

              ),
            ),
          ),
        ),
      )
    );
  }
}
