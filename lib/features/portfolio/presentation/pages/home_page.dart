import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/widgets/menu_mobile_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/menu_web_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeWidget(key: homeKey),
          ],
        ),
      ),
    );
  }
}
