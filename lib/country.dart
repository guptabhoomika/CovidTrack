import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List countryData;
   getCountryData() async{
    http.Response _response = await http.get("https://corona.lmao.ninja/countries");
    setState(() {
      
      countryData = jsonDecode(_response.body);
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    getCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Stats"),
      ),
      body: countryData==null ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: countryData== null ? 0: countryData.length,
        itemBuilder: (context,index){
        return Container(
          
          height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(color: Colors.white,boxShadow: [
              BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10)),
              
            ]),
            child: Row(children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(countryData[index]['country'],style: TextStyle(fontWeight:  FontWeight.bold),),
                    Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),
                  ],
                ),
              ),
              Expanded(child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Text('CONFIRMED:' + countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      Text('ACTIVE:' + countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text('RECOVERED:' + countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      Text('DEATHS:' + countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                     countryData[index]['todayCases']==0 ? Container() : Column(
                        children: <Widget>[
                          Text('+ ' + countryData[index]['todayCases'].toString() +' cases today',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),
                          Text('+ ' + countryData[index]['todayDeaths'].toString() +' deathes today',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),
                        ],
                      )
                  ],
                ),
              ))
            ],),
        );
      }),
      
    );
  }
}