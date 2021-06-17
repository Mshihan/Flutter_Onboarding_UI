import 'package:flutter/material.dart';
import 'package:flutteronboardui/ScreenParagraphs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoardPageOne(),
    );
  }
}

class OnBoardPageOne extends StatefulWidget {
  @override
  _OnBoardPageOneState createState() => _OnBoardPageOneState();
}

int _currentPage = 0;

class _OnBoardPageOneState extends State<OnBoardPageOne>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  ScreenParagraphs _paragraphs;

  Future<bool> _onWillPop() async {
    if (_currentPage != 0) {
      setState(() {
        _pageController.animateToPage(
          --_currentPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _paragraphs = ScreenParagraphs();
  }

  double height;
  double width;
  final int _pageCount = 3;
  double skipOpacity = 1.0;
  double backOpacity = 0.0;
  double nextButtonOpacity = 1.0;
  double _bottomContainer = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    switch (_currentPage) {
      case 0:
        skipOpacity = 1.0;
        backOpacity = 0.0;
        nextButtonOpacity = 1.0;
        _bottomContainer = height;
        break;
      case 1:
        skipOpacity = 1.0;
        backOpacity = 1.0;
        nextButtonOpacity = 1.0;
        _bottomContainer = height;
        break;
      case 2:
        skipOpacity = 0.0;
        backOpacity = 1.0;
        nextButtonOpacity = 0.0;
        _bottomContainer = 790;
        break;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            //Page View
            PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.lightBlue,
                        Colors.blue,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Image.asset('assets/images/adventure.png'),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 50, top: 20, right: 50),
                          child: Text(
                            _paragraphs.screenOneTitle,
                            style: GoogleFonts.sriracha(
                                fontSize: 30, color: Colors.white, height: 1.2),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            _paragraphs.screenOneParagraph,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.2,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightGreenAccent,
                        Colors.lightGreen,
                        Colors.green,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: Image.asset(
                            'assets/images/travelers.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 50, top: 20, right: 50),
                          child: Text(
                            _paragraphs.screenTwoTitle,
                            style: GoogleFonts.sriracha(
                                fontSize: 30, color: Colors.white, height: 1.2),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            _paragraphs.screenTwoParagraph,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.2,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink[300],
                        Colors.pinkAccent,
                        Colors.pink,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: Image.asset(
                            'assets/images/world_connected.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 50, top: 20, right: 50),
                          child: Text(
                            _paragraphs.screenThreeTitle,
                            style: GoogleFonts.sriracha(
                                fontSize: 30, color: Colors.white, height: 1.2),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            _paragraphs.screenThreeParagraph,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.2,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //Page indicator
            Positioned(
              bottom: height * 0.2,
              left: width * 0.5 - 43,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.white.withOpacity(0.1),
                    activeDotColor: Colors.white),
              ),
            ),
            //Next button
            Positioned(
              right: 30,
              bottom: 30,
              child: AnimatedOpacity(
                opacity: nextButtonOpacity,
                duration: Duration(milliseconds: 600),
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage == 2) {
                    } else {
                      _pageController.animateToPage(
                        ++_currentPage,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Next',
                        style: GoogleFonts.sriracha(
                            fontSize: 20, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Skip Button
            Positioned(
              top: 80,
              right: 30,
              child: AnimatedOpacity(
                opacity: skipOpacity,
                duration: Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Skip',
                        style: GoogleFonts.sriracha(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.fast_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Back Button
            Positioned(
              top: 80,
              left: 30,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 600),
                opacity: backOpacity,
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage == 0) {
                    } else {
                      _pageController.animateToPage(
                        --_currentPage,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Text(
                        'Back',
                        style: GoogleFonts.sriracha(
                            fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //back Panel
            Positioned(
              child: AnimatedContainer(
                curve: Curves.easeInCirc,
                transform: Matrix4.translationValues(0, _bottomContainer, 1),
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(30),
//                    topLeft: Radius.circular(30),
//                  ),
                ),
                width: width,
                height: height - 780,
                child: Center(
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.sriracha(
                      fontSize: 35,
                      color: Colors.pink,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
