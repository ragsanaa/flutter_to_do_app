import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/widgets/custom_appbar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Center(
                  child: Text(
                "Subscribe to Proto Coders Point",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
        ), // Use the CustomAppBar as the appBar
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
                childCount: 100, // Example list content
              ),
            ),
          ],
        ),
      ),
    );
  }
}
