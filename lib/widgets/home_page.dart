import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Local File List
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(width: double.infinity, height: double.infinity),
            ),
          )),
          // Remote File List
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(width: double.infinity, height: double.infinity),
            ),
          )),
        ],
      ),
    );
  }
}
