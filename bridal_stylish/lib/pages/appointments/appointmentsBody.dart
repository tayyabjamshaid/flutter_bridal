
import 'package:bridal_stylish/pages/appointments/appointmentApi.dart';
import 'package:bridal_stylish/pages/index.dart';
import 'package:flutter/material.dart';


class showAppointments extends StatefulWidget {
  const showAppointments({ Key? key }) : super(key: key);



  @override
  _showAppointmentsState createState() => _showAppointmentsState();
}

class _showAppointmentsState extends State<showAppointments> {
  Appointments appointmentServices=Appointments();
 

 Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Center(child: Text("Appointments"),) ),
    body:Stack(children: [Container(child: FutureBuilder<List>(future: appointmentServices.getAllAppointments(),builder: (context,snapshot){
      print(snapshot);
      
     if(snapshot.hasData){
       
     
    return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context,i){
      return Card(child: ListTile(
       leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${snapshot.data![i]['startTime']}''',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold)), // icon
            Text('|',style: TextStyle(fontSize: 15)),
            Text('${snapshot.data![i]['endTime']}''',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold)), // text
          ],
        ),
      
       
        title: Text(snapshot.data![i]['customerName'],style: TextStyle(fontSize: 18.0),),
        subtitle:Text(snapshot.data![i]['locationType'],style: TextStyle(fontSize: 14.0,),),
        trailing:Text(snapshot.data![i]['status'],style: TextStyle(fontSize: 15.0,color: Colors.green),)
         
      ),);
    });
     }
     
      else{
       return const Center(child:Text("No Data Found") ,);
     }
    },))
    ,
    
     
    ],
    
    
  
    
    ),
     
    );
  }
}


