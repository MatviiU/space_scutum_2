import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_response.dart';

part 'test_api.g.dart';

//I used retrofit for better API handling and secure humans mistakes

@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
abstract class TestApi {
  factory TestApi(Dio dio, {String baseUrl}) = _TestApi;

  @GET('/character')
  Future<CharactersResponse> getCharacters(@Query('page') int page);
}
