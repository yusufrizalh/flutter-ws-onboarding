import 'package:flutter/material.dart';

class SpamPage extends StatefulWidget {
  const SpamPage({super.key});

  @override
  State<SpamPage> createState() => _SpamPageState();
}

class _SpamPageState extends State<SpamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Spam Page',
              style: TextStyle(
                fontSize: 28,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
