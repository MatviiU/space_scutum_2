import 'package:go_router/go_router.dart';
import 'package:space_scutum_2/features/characters/presentation/screens/main_page.dart';
import 'package:space_scutum_2/router/route_names.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.mainPage,
      builder: (context, state) {
        return const MainPage();
      },
    ),
  ],
);
