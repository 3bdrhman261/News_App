
import 'package:go_router/go_router.dart';
import '../screens/ArtcleScreen/artcle_screem.dart';
import '../screens/HomeScreen/home_screen.dart';
import '../screens/Search resultsScreen/search_results_screen.dart';
import '../screens/SearchScreen/search_screen.dart';
import 'app_routering.dart';

  class RouterGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        name: AppRouter.homeScreen,
        path: AppRouter.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRouter.searchScreen,
        path: AppRouter.searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: AppRouter.searchResults,
        path: AppRouter.searchResults,
         builder: (context, state) => const SearchResultsScreen(),
      ),
      GoRoute(
        name: AppRouter.artcleScreen,
        path: AppRouter.artcleScreen,
         builder: (context, state) => const ArtcleScreem(),
      ),
     
    ],
  );
}
