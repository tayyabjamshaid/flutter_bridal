


import 'package:bridal_stylish/pages/appointments/appointmentsBody.dart';
import 'package:bridal_stylish/pages/catalogs/catalogsBody.dart';
import 'package:flutter/material.dart';

class showBody extends StatefulWidget {
  const showBody({ Key? key }) : super(key: key);

  @override
  _showBodyState createState() => _showBodyState();
}

class _showBodyState extends State<showBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: new Center(child: new Text("Bridal Stylish App", textAlign: TextAlign.center)),
   
    ),
    body: ListView(padding:EdgeInsets.fromLTRB(10,20,10,10),children: [ 

Container(height: 173.0,width: 400.0,
        margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 2.0),decoration: BoxDecoration(color: Color.fromARGB(255, 238, 141, 174)),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
      Padding(padding: EdgeInsets.only(left:17), //apply padding to some sides only
  child:Text("GOOD MORNING, DINA!",style: TextStyle(fontSize: 20.0,color: Colors.white)))
      , Padding(padding: EdgeInsets.only(left:17, bottom: 18), //apply padding to some sides only
  child:Text("April 1, 2022",style: TextStyle(fontSize: 20.0,color: Colors.white),))
  ],
      )
    ),
   Container( margin: EdgeInsets.symmetric(vertical: 17.0,horizontal: 1.0),child: Row(children: [
     Container(margin:const EdgeInsets.only(left: 3.0, right: 5.0),decoration: BoxDecoration(
    border: Border.all(color: Color.fromARGB(255, 238, 141, 174))
  ),padding:  const EdgeInsets.fromLTRB(6, 0, 6, 0),child:ElevatedButton.icon(
  onPressed: () {},
  icon: Icon( // <-- Icon
    Icons.message,
    size: 12.0,
  ),
  label: Text('Messaging'), // <-- Text
),),
      Container(margin:const EdgeInsets.only(left: 3.0, right: 5.0),decoration: BoxDecoration(
    border: Border.all(color: Color.fromARGB(255, 238, 141, 174))
  ),padding:  const EdgeInsets.fromLTRB(6, 0, 6, 0),child:ElevatedButton.icon(
  onPressed: () {},
  icon: Icon( // <-- Icon
    Icons.add_shopping_cart,
    size: 14.0,
  ),
  label: Text('Checkout'), // <-- Text
),), Container(margin:const EdgeInsets.only(left: 3.0),decoration: BoxDecoration(
    border: Border.all(color: Color.fromARGB(255, 238, 141, 174))
  ),padding:  const EdgeInsets.fromLTRB(6, 0, 6, 0),child:ElevatedButton.icon(
  onPressed: () => {Navigator.push(context,MaterialPageRoute(builder: (context)=>catalogs()))},
  icon: Icon( // <-- Icon
    Icons.account_balance_wallet_outlined,
    size: 15.0,
  ),
  label: Text('Catalog'), // <-- Text
),)
   ]),),
   Container( margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 1.0),child:Center(child:Text("My Day",textDirection: TextDirection.ltr,style: TextStyle(fontSize: 20,color: Colors.black)),)),
    Container( margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 1.0),child: Row(children: [

   Container(margin:const EdgeInsets.only(left: 1.0),decoration: BoxDecoration(
   
  ),padding:  const EdgeInsets.fromLTRB(6, 0, 6, 0),child:SizedBox(
  width: 185, // <-- Your width
  height: 75, // <-- Your height
  child: OutlinedButton.icon(
  icon: Icon(Icons.badge),
  label: Text("Appointments"),
  onPressed: () => {Navigator.push(context,MaterialPageRoute(builder: (context)=>showAppointments()))},
  style: ElevatedButton.styleFrom(
    side: BorderSide(width: 2.0, color: Color.fromARGB(255, 238, 141, 174)),
   
  ),
)
),),  
    Container(decoration: BoxDecoration(
   
  ),padding:  const EdgeInsets.fromLTRB(0, 0, 6, 0),child:SizedBox(
  width: 185, // <-- Your width
  height: 75, // <-- Your height
  child: OutlinedButton.icon(
  icon: Icon(Icons.star_outline),
  label: Text("Tasks"),
  onPressed: () => print("it's pressed"),
  style: ElevatedButton.styleFrom(
    side: BorderSide(width: 2.0, color: Color.fromARGB(255, 238, 141, 174)),
   
  ),
)
),),  
   ]),),
    Container( margin: EdgeInsets.fromLTRB(2,0,0,16),child: Row(children: [

   Container(margin:const EdgeInsets.only(left: 1.0),decoration: BoxDecoration(
   
  ),padding:  const EdgeInsets.fromLTRB(6, 0, 6, 0),child:SizedBox(
  width: 185, // <-- Your width
  height: 75, // <-- Your height
  child: OutlinedButton.icon(
  icon: Icon(Icons.message),
  label: Text("Messages"),
  onPressed: () => print("it's pressed"),
  style: ElevatedButton.styleFrom(
    side: BorderSide(width: 2.0, color: Color.fromARGB(255, 238, 141, 174)),
   
  ),
)
),),  
    Container(decoration: BoxDecoration(
   
  ),padding:  const EdgeInsets.fromLTRB(0, 0, 6, 0),child:SizedBox(
  width: 185, // <-- Your width
  height: 75, // <-- Your height
  child: OutlinedButton.icon(
  icon: Icon(Icons.account_box_outlined),
  label: Text("Follow-Ups"),
  onPressed: () => print("it's pressed"),
  style: ElevatedButton.styleFrom(
    side: BorderSide(width: 2.0, color: Color.fromARGB(255, 238, 141, 174)),
   
  ),
)
),),  
   ]),),
    Divider(
              color: Colors.black
            ),
  
     ],)
    );
  }
}

