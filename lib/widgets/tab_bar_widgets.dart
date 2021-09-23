import 'package:flutter/material.dart';

class TabBarWidgets extends StatelessWidget {
  const TabBarWidgets({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${(title)} " + index.toString()),
          );
        },
      ),
    );
  }
}
