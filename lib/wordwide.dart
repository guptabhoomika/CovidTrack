import 'package:flutter/material.dart';
class WorldWide extends StatelessWidget {
  final Map worldData;
  WorldWide({this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          StatusPannel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPannel(
             title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPannel(
              title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPannel(
               title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: worldData['deaths'].toString(),
          ),
          

        ],

      ),
      
    );
  }
}
class StatusPannel extends StatelessWidget {
   final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  StatusPannel({this.count,this.panelColor,this.textColor,this.title});

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    return Container(

      height: 150,
      width: width/2,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(20)
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: textColor),),
          Text(count,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: textColor))

        ],
      ),
      
    );
  }
}