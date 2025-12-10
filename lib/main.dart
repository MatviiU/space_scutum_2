import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/di/get_it.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episodes_cubit.dart';
import 'package:space_scutum_2/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CharactersCubit>()..getCharacters(),
        ),
        BlocProvider(
          create: (context) => getIt<EpisodesCubit>()..getEpisodes(),
        ),
      ],
      child: MaterialApp.router(title: 'Flutter Demo', routerConfig: router),
    );
  }
}
