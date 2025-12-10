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

  //dynamic because the API response is bad
  @GET('/character/{ids}')
  Future<dynamic> getCharactersByIds(@Path('ids') String ids);

  //dynamic because the API response is bad
  @GET('/episode/{ids}')
  Future<dynamic> getEpisodesByIds(@Path('ids') String ids);
}
