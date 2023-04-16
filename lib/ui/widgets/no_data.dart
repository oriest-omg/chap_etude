import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String string;

  const NoData(this.string, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        string,
        style: const TextStyle(
            color: Colors.teal,
            fontSize: 25,
            fontStyle: FontStyle.italic
        ),
      ),
    );
  }

}