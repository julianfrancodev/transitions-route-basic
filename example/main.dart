import 'package:flutter/material.dart';
import 'package:transitions_route_basic/transitions_route_basic.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/page1",
    routes: {
      "/page1": (_) => Page1(),
      "/page2": (_) => Page2(),
    },
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: MaterialButton(
        child: Text("Go to page 2"),
        color: Colors.white,
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) => Page2()));

          // Navigator.pushNamed(context, '/page2');
          //
          TransitionsRouteBasic(
            context: context,
            child: Page2(),
            animation: AnimationType.nomal,
            duration: Duration(milliseconds: 300),
          );
        },
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("Page2"),
      ),
    );
  }
}
