// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MovieService extends MovieService {
  _$MovieService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieService;

  @override
  Future<Response<Popular>> getPopularMovies() {
    final $url = 'movie/popular';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Popular, Popular>($request);
  }
}
