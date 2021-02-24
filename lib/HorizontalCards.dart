import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_project/constants/Constants.dart';
import 'package:flutter_movie_project/providers/CurrentPageNotifier.dart';
import 'package:provider/provider.dart';

import 'models/popular.dart';
import 'models/result.dart';
import 'networking/movie_service.dart';

class HorizontalCard extends StatelessWidget {
  // this is similar to view pager
  final PageController pageController = PageController(viewportFraction: 0.8);
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      int next = pageController.page.round();

      Provider.of<CurrentPage>(context, listen: false)
          .setCurrentPage(currentPage != next ? next : currentPage);
    });
    return Scaffold(body: _buildBody(context));
  }

  FutureBuilder<Response<Popular>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<Popular>>(
      future: Provider.of<MovieService>(context).getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          final popular = snapshot.data.body;
          return Consumer<CurrentPage>(builder: (context, page, child) {
            return PageView.builder(
              controller: pageController,
              itemCount: popular.results.length + 1,
              itemBuilder: (context, int currentIndex) {
                if (popular.results.length > currentIndex) {
                  bool active = currentIndex == page.currentPage;
                  return _buildStoryPage(popular.results[currentIndex], active);
                }
              },
            );
          });
        } else {
          // Show a loading indicator while waiting for the movies
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildStoryPage(Result result, bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(Constants.IMAGE_URL + result.posterPath),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset),
            )
          ]),
    );
  }
}
