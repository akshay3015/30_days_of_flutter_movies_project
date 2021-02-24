import 'dart:async';
import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = "Authorization";

  static const String BEARER = "Bearer ";

  static const String V4_AUTH_HEADER =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2Y0ODhhMGQzMTczZmI5YTUyN2IwMTUxMzlmMjJmNCIsInN1YiI6IjU5MzFlN2MyOTI1MTQxN2RkNDAwMDQwZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yqRMMPH_-6mHB1XavvUrNGiPGPMvy7wLePpNqtVKApg";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest =
        request.copyWith(headers: {AUTH_HEADER: BEARER + V4_AUTH_HEADER});
    return newRequest;
  }
}
