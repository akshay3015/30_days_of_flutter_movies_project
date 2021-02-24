import 'package:flutter/material.dart';
import 'package:flutter_movie_project/HorizontalCards.dart';
import 'package:flutter_movie_project/networking/movie_service.dart';
import 'package:flutter_movie_project/providers/CurrentPageNotifier.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<MovieService>(
              create: (_) => MovieService.create(),
              dispose: (_, MovieService service) => service.client.dispose()),
          ChangeNotifierProvider(create: (context) => CurrentPage())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HorizontalCard(),
        ));
  }
}
