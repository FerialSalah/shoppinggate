import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> myTabs = <Widget>[
    Text(
      'LOGIN',
      style: TextStyle(color: Colors.white),
    ),
    Text(
      'SIGNUP',
      style: TextStyle(color: Colors.white),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  Widget bodyContent() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
              color: Color(0xff10435f),
              width: width,
              height: height / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: height * .08,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: width * 0.5,
                    height: height * .15,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    'Buying your stuff with us \n  in just 3 steps ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: height * .08,
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        controller: _tabController,
                        tabs: myTabs,
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Color(0xffffb558),
                        indicatorWeight: 4,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget tabView() {
    return Container(
      child: TabBarView(
        children: [
          Center(child: Text("Page 1")),
          Center(child: Text("Page 2")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xff10435f),
    ));

    return Scaffold(
      body: tabView(),
    );
  }
}
