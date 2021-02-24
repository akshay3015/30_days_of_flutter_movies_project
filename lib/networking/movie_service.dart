import 'package:chopper/chopper.dart';
import 'package:flutter_movie_project/models/popular.dart';
import 'generic_model_converter.dart';
import 'header_interceptor.dart';
part 'movie_service.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService {
  @Get(path: 'movie/popular')
  Future<Response<Popular>> getPopularMovies();

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      converter: JsonToTypeConverter({
        Popular: (jsondata) => Popular.fromJson(jsondata),
      }),
      errorConverter: JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );

    return _$MovieService(client);
  }
}
