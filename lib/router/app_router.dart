import 'package:go_router/go_router.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';
import 'package:space_scutum_2/features/characters/presentation/screens/character_details_screen.dart';
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
      routes: [
        GoRoute(
          path: 'product-details',
          name: RouteNames.characterDetails,
          builder: (context, state) {
            return CharacterDetailsScreen(character: state.extra! as Character);
          },
        ),
      ],
    ),
  ],
);
