import 'package:flutter/material.dart';
class MostAffected extends StatelessWidget {
  final List data;

  const MostAffected({Key key, this.data}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
         itemCount: 5,
         physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            children: <Widget>[
              Image.network(data[index]['countryInfo']['flag'],height: 25,),
              SizedBox(width: 10,),
              Text(data[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Text('Deaths:' + data[index]['deaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)

            ],
          )
        );
      }
     
      ),
      
    );
  }
}