import 'dart:convert';
import 'dart:io';
import 'package:bali_arcade/pojo/ResponseFoodMenu.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiFoodMenuResponse {
  Future<ResponseFoodMenu> getUser(String fid) async {
    String fileNamefood = "foodMenu$fid.json";
    var dirfood = await getTemporaryDirectory();
    File filefood = new File(dirfood.path + "/" + fileNamefood);
    if (filefood.existsSync()) {
      print("Loading from cache");
      var jsonData = filefood.readAsStringSync();
      ResponseFoodMenu responsefood =  
          ResponseFoodMenu.fromJson(json.decode(jsonData));
      return responsefood;
    }
    else {
      print("Loading from API");
      String _BASE_URL =
          "http://baliarcade.work/api/baliarcade/all/menu/category/$fid";
      var response = await http.get(_BASE_URL);
      if (response.statusCode == 200) {
        var jsonResponse2 = response.body;
        ResponseFoodMenu res2 =
            ResponseFoodMenu.fromJson(json.decode(jsonResponse2));
        print(res2);

        //save json in local file
        filefood.writeAsStringSync(jsonResponse2,
            flush: true, mode: FileMode.write);
        return res2;
      }
    }
  }
}


