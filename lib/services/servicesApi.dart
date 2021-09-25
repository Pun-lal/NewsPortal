import 'package:news_portal/helpers/ApiClients.dart';
import 'package:news_portal/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class SevicesApi {
  static Future<NewsModel?> newsArticles(
      {String? newsTypes, String? sortsBy = "popular"}) async {
    try {
      var url =
          Uri.parse(ApiClients().newsApi(newsType: newsTypes, sortBy: sortsBy));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return newsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
