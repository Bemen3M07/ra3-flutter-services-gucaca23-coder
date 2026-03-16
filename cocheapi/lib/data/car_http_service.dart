import 'package:cocheapi/data/CarsModel.dart';
import 'package:http/http.dart' as http;


class CarHttpService{
      final String _url = "https://car-data.p.rapidapi.com";
      final String _headerKey = "3500a5fff6msh557c9f4e6998cd8p1a6ec9jsnd32b8eadd6b8"; 
      final String _headerHost = "car-data.p.rapidapi.com";


  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse("$_url/cars");
    var response = await http.get(uri,
        headers: {
          "X-RapidAPI-Key": _headerKey,
          "X-RapidAPI-Host": _headerHost
        });

    
    if(response.statusCode == 200){
      return carsModelFromJson(response.body);
    }else{
      throw("A surgido un error");
    }
  }

}