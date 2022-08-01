import 'package:http/http.dart' as http;
import 'package:meow_api/models/meow_model.dart';

class MeowService {
  Future<List<MeowwModel>> getMeow() async {
    List<MeowwModel> meoww = [];
    var client = http.Client();
    String catApi = "https://api.thecatapi.com/v1/images/search?mime_types=gif";

    try {
      var uri = Uri.parse(catApi);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        meoww = meowwModelFromJson(json);
      }
    } catch (e) {
      rethrow;
    }

    return meoww;
  }
}
