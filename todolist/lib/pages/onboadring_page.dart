import 'package:flutter/material.dart';
import 'package:todolist/pages/todopage.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _totalPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                    image: "images/one.png",
                    color: Color(0xFFFF7252),
                    body: "You dont know from where and when to start ? ",
                    isShowingImageTop: false,
                    siz: 5),
                _buildPageContent(
                    image: "images/two.png",
                    color: Color(0xFFFFA131),
                    body:
                        "You just need to set up your time and work with few  checkBoxs",
                    isShowingImageTop: true,
                    siz: 5),
                _buildPageContent(
                    image: "images/three.png",
                    color: Color(0xFF3C60FF),
                    body: "To achieve your goal and success in your life ",
                    isShowingImageTop: false,
                    siz: 5),
              ],
            ),
            Positioned(
                bottom: 40.0,
                left: MediaQuery.of(context).size.width * .05,
                child: Row(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Row(
                          children: [
                            for (int i = 0; i < _totalPage; i++)
                              i == _currentPage
                                  ? _buildPageIndic(true)
                                  : _buildPageIndic(false),
                            Spacer(),
                            if (_currentPage != 2)
                              InkWell(
                                onTap: () {
                                  _pageController.animateToPage(2,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear);
                                  setState(() {});
                                },
                                child: Container(
                                    height: 60,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              ),
                            if (_currentPage == 2)
                              InkWell(
                                onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Todo()));
                                },
                                child: Container(
                                    height: 60,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Start',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              )
                          ],
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(
      {String image,
      Color color,
      double siz,
      String body,
      bool isShowingImageTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // ignore: sdk_version_ui_as_code
          if (!isShowingImageTop)
            Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    image,
                    scale: siz,
                  ),
                ),
                SizedBox(height: 50),
                Text(body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        height: 1.6,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))
              ],
            ),
          // ignore: sdk_version_ui_as_code
          if(isShowingImageTop)
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        height: 1.6,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    image,
                    scale: siz,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildPageIndic(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isCurrentPage ? 18 : 10,
      width: isCurrentPage ? 18 : 10,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
