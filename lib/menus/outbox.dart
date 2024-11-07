import 'package:flutter/material.dart';

class OutboxPage extends StatefulWidget {
  const OutboxPage({super.key});

  @override
  State<OutboxPage> createState() => _OutboxPageState();
}

class _OutboxPageState extends State<OutboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Outbox Page',
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
