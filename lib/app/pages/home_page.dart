import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:origemjhanpoll_github_io/core/widgets/menu_mobile_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/menu_web_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      endDrawer:
          size.width <= 900 ? MenuMobileWidget(onMenuClick: (value) {}) : null,
      appBar: size.width <= 900
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: RichText(
                text: TextSpan(
                  text: 'Jean',
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                  children: <TextSpan>[
                    TextSpan(text: 'Paul', style: theme.textTheme.titleLarge),
                  ],
                ),
              ),
            )
          : MenuWebWidget(
              onMenuClick: (value) {},
            ),
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
