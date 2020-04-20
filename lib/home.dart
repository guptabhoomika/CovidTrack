import 'dart:convert';
import 'package:covid_tacker/apiservices.dart';
import 'package:covid_tacker/statewise.dart';
import 'package:covid_tacker/statewise.dart';

import './faq.dart';
import 'package:covid_tacker/datasource.dart';
import 'package:covid_tacker/info.dart';
import 'package:covid_tacker/mostaffected.dart';
import 'package:covid_tacker/wordwide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'country.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
Map worldData;
List countryData;
List stateData;
class _HomePageState extends State<HomePage> {
  getData() async{
    http.Response _response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      
      worldData = jsonDecode(_response.body);
    });

  }
  
 
  getCountryData() async{
    http.Response _response = await http.get("http://corona.lmao.ninja/v2/countries?sort=deaths");
    setState(() {
      
      countryData = jsonDecode(_response.body);
    });

  }
  Map indiaData;
  getIndiaData() async{
    http.Response _response = await http.get("https://corona.lmao.ninja/v2/countries/India");
    setState(() {
      
      indiaData = jsonDecode(_response.body);
    });

  }

  @override
  void initState() {
    // TODO: implement initState

    getData();
    getCountryData();
    getIndiaData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              color: Colors.orange[100],
              child: Text(DataSource.quote,style: TextStyle(color: Colors.orange[600],fontSize: 14,fontWeight: FontWeight.bold),),
            ),
             Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Worldwide',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Country()));
            },
            child: Container(
                decoration: BoxDecoration(
                  color:Color(0xff202c3b),
                  borderRadius: BorderRadius.circular(15)

                ),
                padding: EdgeInsets.all(10),
                child: Text('Regional',style: TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold),)),
          ),
        ],
      ),
    ),
         worldData == null ? Center(child:CircularProgressIndicator() ):   WorldWide(worldData: worldData,),
         
         Padding(
           padding: const EdgeInsets.only(left:8.0,top: 8),
           child: Text('Most Affected Countries',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
         ),
         SizedBox(height: 10,),
         countryData==null ? Container() : MostAffected(data: countryData,),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.only(left:20),
           child: Text("Target Country",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
         ),
         SizedBox(height: 5,),
        indiaData==null ? Container() : GestureDetector(
          onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StateData()));
                
          },
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          //itemCount: countryData== null ? 0: countryData.length,
          //itemBuilder: (context,index){
          children: <Widget>[
    Container(
  
              
  
              height: 130,
  
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
  
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
  
                    child: Column(
  
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
  
                      children: <Widget>[
  
                        Text("India",style: TextStyle(fontWeight:  FontWeight.bold),),
  
                        Image.network(indiaData['countryInfo']['flag'],height: 50,width: 60,),
  
                      ],
  
                    ),
  
                  ),
  
                  Expanded(child: Container(
  
                    child: Column(
  
                      mainAxisAlignment: MainAxisAlignment.center,
  
                      children: <Widget>[
  
                          Text('CONFIRMED:' + indiaData['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
  
                          Text('ACTIVE:' + indiaData['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
  
                          Text('RECOVERED:' + indiaData['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
  
                          Text('DEATHS:' + indiaData['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800]),),
  
                          indiaData['todayCases']== 0 ? Container() : Column(
  
                            children: <Widget>[
  
                              Text('+ ' + indiaData['todayCases'].toString() +' cases today',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),
  
                              Text('+ ' + indiaData['todayDeaths'].toString() +' deathes today',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),
  
                            ],
  
                          )
  
                      ],
  
                    ),
  
                  ))
  
                ],),
  
            ),
]
      ),
        ),
     
         Info(),
    SizedBox(height: 20,),
    Center(child: Text('WE ARE TOGETHER IN THE FIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
    SizedBox(height: 50,)

          ],
        ),
      ),
    );
  }
}