import 'package:badges/badges.dart';
import 'package:bridal_stylish/pages/appointments/appointmentApi.dart';
import 'package:bridal_stylish/pages/index.dart';
import 'package:bridal_stylish/pages/models/cart_model.dart';
import 'package:bridal_stylish/pages/models/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';


class checkOut extends StatefulWidget {
  const checkOut({ Key? key }) : super(key: key);



  @override
  _checkOutState createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  DBHelper? dbHelper=DBHelper();
 Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    bool _myBool=false;
    return Scaffold(appBar: AppBar(
      title:  Text("My Cart"),centerTitle: true,titleSpacing: 0,
    ),
    body:Column(children: [
      FutureBuilder(future: cart.getData(),builder: (context,AsyncSnapshot<List<Cart>> snapshot){
         if(snapshot.hasData){
               if(snapshot.data!.isEmpty){
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/empty_cart.png'),
                          ),
                          SizedBox(height: 20,),
                          Text('Your cart is empty 😌' ,style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 20,),
                          Text('Explore products and shop your\nfavourite items' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.subtitle2)

                        ],
                      ),
                    );
                  }else {
         return Expanded(child: ListView.builder(  itemCount: snapshot.data?.length,itemBuilder: (context,i){
    return  Container(
        child: TextButton(
          // here toggle the bool value so that when you click 
          // on the whole item, it will reflect changes in Checkbox
          onPressed: () => setState(() => _myBool = !_myBool),
          style: TextButton.styleFrom(
        primary: Colors.black,
      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                  value: _myBool,
                  onChanged: (value){
                    //  setState(() => _myBool = value);
                  }
                )
              ),
              // You can play with the width to adjust your
              // desired spacing
              SizedBox(width: 5.0),
              SizedBox(width: 150,child: Text(snapshot.data![i].productCategory.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),),
              SizedBox(width: 10.0),
             SizedBox(width: 90,child: Text('\$${snapshot.data![i].productPrice}''',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),),
           
              SizedBox(width: 3.0),
              SizedBox(
  width: 36, // <-- Your width
  height: 35, // <-- Your height
  child: ElevatedButton( child: Center(child: Text('-',style: TextStyle(fontWeight: FontWeight.bold),)),
      onPressed: () {
          int quantity=snapshot.data![i].quantity!;
         int price=snapshot.data![i].initialPrice!;
         quantity--;
         int? newPrice=price * quantity;
         if(quantity==0){
                                               dbHelper!.delete(snapshot.data![i].id!);
                                                        cart.removerCounter();
                                                        cart.removeTotalPrice(double.parse(snapshot.data![i].productPrice.toString()));
         }else{
         dbHelper!.updateQuantity(Cart( id: snapshot.data![i].id!,
                                       productId: snapshot.data![i].id!.toString(),
                                       productName: snapshot.data![i].productName!,
                                       initialPrice: snapshot.data![i].initialPrice!,
                                       productCategory: snapshot.data![i].productCategory!,
                                      productPrice: newPrice,
                                       quantity: quantity,
                                      image: snapshot.data![i].image.toString())
                                      ).then((value){
                                         newPrice = 0 ;
                                         quantity = 0;
                                        cart.removeTotalPrice(double.parse(snapshot.data![i].initialPrice!.toString()));
                                           }).onError((error, stackTrace){
                                        print(error.toString());
                                       });}
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
           
     ),)
),
   Container(margin:const EdgeInsets.only(left: 5.0, right: 5.0),child: Text(snapshot.data![i].quantity.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
   SizedBox(
  width: 36, // <-- Your width
  height: 35, // <-- Your height
  child: ElevatedButton( child: Center(child: Text('+')),
      onPressed: () {
        int quantity=snapshot.data![i].quantity!;
         int price=snapshot.data![i].initialPrice!;
         quantity++;
         int? newPrice=price * quantity;
         dbHelper!.updateQuantity(Cart( id: snapshot.data![i].id!,
                                       productId: snapshot.data![i].id!.toString(),
                                       productName: snapshot.data![i].productName!,
                                       initialPrice: snapshot.data![i].initialPrice!,
                                       productCategory: snapshot.data![i].productCategory!,
                                      productPrice: newPrice,
                                       quantity: quantity,
                                      image: snapshot.data![i].image.toString())
                                      ).then((value){
                                         newPrice = 0 ;
                                         quantity = 0;
                                        cart.addTotalPrice(double.parse(snapshot.data![i].initialPrice!.toString()));
                                           }).onError((error, stackTrace){
                                        print(error.toString());
                                       });
                                                               
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
           
     ),)
),


            ]
          )
        )
      );
    }));
         }}
         return Text("");
      }),
      Consumer<CartProvider>(builder: (context, value, child){
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                child:Padding( padding: const EdgeInsets.only(
      left: 10,
     
      right: 10,
      
    ),child: Column(
                  children: [
                    ReusableWidget(title: 'SUBTOTAL', value: r'$'+value.getTotalPrice().toStringAsFixed(2),),
                    ReusableWidget(title: 'VAT %', value: r'$'+'18.9'),
                    ReusableWidget(title: 'DISCOUNT', value: r'$'+'0',),
                      Divider(
              color: Colors.black
            ),
                    ReusableWidget(title: 'Total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),),
                    Padding(padding:  const EdgeInsets.only(top: 10,bottom: 20),child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: () {},
      child: const Text(
        'Place Order',
        style: TextStyle(fontSize: 24),
      ),
    ),)
                  ],
                ),)
              );
            })
    ],)
    );
   
  }
}
class ReusableWidget extends StatelessWidget {
  final String title , value ;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: Theme.of(context).textTheme.subtitle2,),
          Text(value.toString() , style: Theme.of(context).textTheme.subtitle2,)
        ],
      ),
    );
  }
}

