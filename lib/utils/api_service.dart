import 'package:http/http.dart' as http;
import 'package:learn_dev/constants/api_values.dart';
import '../screens/home_screen/models/post.dart';

//API calls can be written here..

class RemoteService {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse(BaseApi.baseApi);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
  }
}
