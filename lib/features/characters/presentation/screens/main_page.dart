import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()
      ..addListener(() {
        // Check if the user is at the bottom of the list
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          context.read<CharactersCubit>().incrementPage();
          context.read<CharactersCubit>().getCharacters();
        }

        // Check if the user is at the top of the list
        if (_scrollController.position.pixels <=
            _scrollController.position.minScrollExtent) {
          context.read<CharactersCubit>().decrementPage();
          context.read<CharactersCubit>().getCharacters();
        }
      });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<CharactersCubit, CharactersState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.isError) {
                    return const Center(child: Text('Error'));
                  }

                  if (state.characters.isEmpty) {
                    return const Center(child: Text('No characters found'));
                  }
                  return ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: state.characters.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.characters.length) {
                        return state.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink();
                      }
                      final character = state.characters[index];
                      return Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  character.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(character.name),
                                subtitle: Text(character.status),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
