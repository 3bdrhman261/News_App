
import 'package:news_api/core/AppConstans/AppConstans.dart';
import 'package:news_api/core/Networking/ApiEndpoints.dart';
import 'package:news_api/core/Networking/dio_heber.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';

class SearchServises {
  seatchItemByName(String query) async {
    try {
      final response = await DioHeber.gitReqost(
        endpont: ApiEndpoints.topHeadline,
        query: {
          "apiKey": Appconstans.NewsApiKye,
           "q": query},
      );
      if (response.statusCode == 200) {
        TopHeadlineModels topHeadlineModels = TopHeadlineModels.fromJson(
          response.data,
        );
        print(topHeadlineModels.totalResults.toString());
        return topHeadlineModels;
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
