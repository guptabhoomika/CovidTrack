import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class StateData extends StatefulWidget {
  @override
  _StateDataState createState() => _StateDataState();
}

class _StateDataState extends State<StateData> {
 

  
   List countryData;
    getStateData() async{
    http.Response _response = await  http.get(
        "https://coronavirus-tracker-india-covid-19.p.rapidapi.com/api/getStatewisesorted",
        headers: {
    "x-rapidapi-host": "coronavirus-tracker-india-covid-19.p.rapidapi.com",
	"x-rapidapi-key": "c2d85b2a10mshb7ec67e51fdd874p1dac5cjsnd48fa74f1bc2"
  });
    setState(() {
      
    countryData = jsonDecode(_response.body);
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    getStateData();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateWise Stats"),
      ),
      body: countryData==null ? Center(child: CircularProgressIndicator(),): Container(
        //color: Colors.accents[10],
        child: SingleChildScrollView(
          
                child: Column(
            children: <Widget>[
             
             
              GridView.builder(
                
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2)),
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: countryData== null ? 0: countryData.length,
                itemBuilder: (context,index){
                return Container(
            
            height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(color: Colors.white,boxShadow: [
                BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10)),
                
              ],
              borderRadius: BorderRadius.circular(0)
              ),
              child: Row(children: <Widget>[
               
                
                Expanded(child: Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(countryData[index]['name'],style: TextStyle(fontWeight:  FontWeight.bold,fontSize: 15),),
                         SizedBox(height: 10,),
                          Text('CONFIRMED:' + countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,),),
                          //Text('ACTIVE:' + countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          Text('RECOVERED:' + countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                          Text('DEATHS:' + countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800],),),
                        //  countryData[index]['todayCases']==0 ? Container() : Column(
                        //     children: <Widget>[
                        //       Text('+ ' + countryData[index]['todayCases'].toString() +' cases today',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),
                        //       Text('+ ' + countryData[index]['todayDeaths'].toString() +' deathes today',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),
                        //     ],
                        //   )
                      ],
                    ),
                  ),
                ))
              ],),
          );;
              }),
            ],
          ),
        ),
      ),
      
    );
  }
}
// class ListStateData extends StatelessWidget {
//   final String name,cnfrm,rcvd,death;
//   ListStateData({this.cnfrm,this.death,this.name,this.rcvd});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Text(name,style: TextStyle(fontWeight:  FontWeight.bold)),
//               //SizedBox(width: 50,),
//               Text(cnfrm,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,)),
//               //SizedBox(width: 10,),
//               Text(rcvd,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,)),
//               //SizedBox(width: 10,),
//               Text(death,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800]))
//             ],
//           ),
//           Divider(color: Colors.grey[300],)
//         ],
//       ),
      
//     );
//   }
// }