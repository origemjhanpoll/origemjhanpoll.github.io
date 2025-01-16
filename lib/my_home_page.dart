import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 4.0,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('@origemjhanpoll', style: theme.textTheme.titleMedium),
            const Text(
              'This site is currently under construction.',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent)),
                  onPressed: () {
                    js.context.callMethod('open',
                        ['https://www.linkedin.com/in/origemjhanpoll/']);
                  },
                  child: Text('LinkedIn')),
            )
          ],
        ),
      ),
    );
  }
}
