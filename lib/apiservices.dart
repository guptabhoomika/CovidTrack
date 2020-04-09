import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
    


      static Future<List> getworldtotalstats() async {
    final response = await http.get(
        "https://coronavirus-tracker-india-covid-19.p.rapidapi.com/api/getStatewise",
        headers: {
    "x-rapidapi-host": "coronavirus-tracker-india-covid-19.p.rapidapi.com",
	"x-rapidapi-key": "c2d85b2a10mshb7ec67e51fdd874p1dac5cjsnd48fa74f1bc2"
  });
        // print(response.body);
    var extractdata = json.decode(response.body);
    print(response.body);
    // print(response.body);
   
      return extractdata;
    
  }

  
}