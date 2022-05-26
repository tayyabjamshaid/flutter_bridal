import 'dart:convert';

import 'package:http/http.dart' as http;
class Catalogs{
  String baseUrl="http://10.0.2.2:3000/catalogAllData";
  Future<List> getAllCatalogs () async{
    try{
   var response=await http.get(Uri.parse(baseUrl));
   if(response.statusCode==200){
     return jsonDecode(response.body);
   }else{
     return Future.error("Server error");
   }
    }catch(e){
 return Future.error(e);
    }
  }
}