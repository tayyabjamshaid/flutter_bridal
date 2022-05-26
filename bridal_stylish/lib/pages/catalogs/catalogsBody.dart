import 'package:badges/badges.dart';
import 'package:bridal_stylish/pages/appointments/appointmentApi.dart';
import 'package:bridal_stylish/pages/cart_provider.dart';
import 'package:bridal_stylish/pages/catalogs/catalogsApi.dart';
import 'package:bridal_stylish/pages/checkout.dart';
import 'package:bridal_stylish/pages/index.dart';
import 'package:bridal_stylish/pages/models/cart_model.dart';
import 'package:bridal_stylish/pages/models/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';


class catalogs extends StatefulWidget {
  const catalogs({ Key? key }) : super(key: key);



  @override
  _catalogsState createState() => _catalogsState();
}

class _catalogsState extends State<catalogs> {
  
 Catalogs catalogServices=Catalogs();
 DBHelper? dbHelper=DBHelper();

 
 Widget build(BuildContext context) {
   final cart=Provider.of<CartProvider>(context);
  
  

    return Scaffold(appBar: AppBar(
      title:  Text("Catalogs"),centerTitle: true,titleSpacing: 0,actions: [Container(margin:EdgeInsets.only( right: 10.0),child:InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>checkOut()));},
      child:Center(child: Badge(badgeContent: Consumer<CartProvider>(builder:(context, value, child) {
       return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white,fontSize: 18),) ;
      }),
      animationDuration: Duration(milliseconds: 300),child: Icon(Icons.shopping_bag_outlined )
      ),
       
    )))],
   
    ),
    body:Stack(children: [Container(child: FutureBuilder<List>(future: catalogServices.getAllCatalogs(),builder: (context,snapshot){
      print(snapshot);
      
      
     if(snapshot.hasData){
     
     
    return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context,i){
    return Card(child: ListTile(
     
      
        title: Text(snapshot.data![i]['categoryName'],style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
        subtitle:Column( mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,children: [Text(snapshot.data![i]['catalogId'],style: TextStyle(fontSize: 16.0,),),
        Text(snapshot.data![i]['catalogName'],style: TextStyle(fontSize: 16.0,),),
        Text(snapshot.data![i]['pricingType'],style: TextStyle(fontSize: 16.0,),)]),
        trailing:Column(mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,children: [Text('\$${snapshot.data![i]['catalogPrice']}''',style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.bold),),SizedBox(height: 13,),
 SizedBox(
    width: 59, // <-- Your width
  height: 22, // <-- Your height
  child: ElevatedButton(onPressed: () {
    dbHelper!.insert(
      Cart( id:snapshot.data![i]['index'],
      productId: snapshot.data![i]['catalogId'].toString(), 
      productName: snapshot.data![i]['catalogName'].toString(), 
      initialPrice: snapshot.data![i]['catalogPrice'],
       productPrice:snapshot.data![i]['catalogPrice'],
        quantity: 1,
         productCategory: snapshot.data![i]['categoryName'].toString(), image: "Image")
    ).then((value){ print("Product is added to Cart");
    cart.addTotalPrice(double.parse(snapshot.data![i]['catalogPrice'].toString()));
    cart.addCounter();
     final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
     ).onError((error, stackTrace){print(error.toString());
     final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
     });
      // Respond to button press
  },
  child: Text('Add'))

 ) ,   ],)
        
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

