class ApiClients {
  newsApi({String? newsType, String? sortBy}) {
    String newsApi =
        "https://newsapi.org/v2/everything?q=$newsType&sortBy=$sortBy&apiKey=085a89ca07844feaad33534785883027";
    return newsApi;
  }
}
