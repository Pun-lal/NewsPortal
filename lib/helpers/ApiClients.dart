import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClients {
  var testNewsApiKey = dotenv.env['NEWS_API_KEY'];
  newsApi({String? newsType, String? sortBy}) {
    String newsApi =
        "https://newsapi.org/v2/everything?q=$newsType&sortBy=$sortBy&apiKey=$testNewsApiKey";
    return newsApi;
  }
}
