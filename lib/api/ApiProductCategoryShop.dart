import 'dart:convert';
import 'dart:io';
import 'package:bali_arcade/pojo/ResponseShopPC.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiProductCategoryShop {
  Future<ResponseShopPC> getUser(String pcId) async {
    String fileName = "pcData$pcId.json";

    var pcdir = await getTemporaryDirectory();

    File pcfile = new File(pcdir.path + "/" + fileName);
    if (pcfile.existsSync()) {
      print("Loading from cache");
      var jsonData = pcfile.readAsStringSync();
      ResponseShopPC response = ResponseShopPC.fromJson(json.decode(jsonData));
      return response;
    } else {
      print("Loading from API");
      String _BASE_URL =
          "http://baliarcade.work/api/baliarcade/all/product/category/$pcId";

      var response = await http.get(_BASE_URL);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        ResponseShopPC res = ResponseShopPC.fromJson(json.decode(jsonResponse));
        print(res);
        //save json in local file
        pcfile.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
        return res;
      } 
    }
  }
}