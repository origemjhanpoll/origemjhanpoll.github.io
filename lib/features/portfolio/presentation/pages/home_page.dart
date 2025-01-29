import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/widgets/drawer_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/app_bar_widget.dart';
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
      drawer: size.width <= ScreenSize.medium
          ? DrawerWidget(onMenuClick: (value) {})
          : null,
      appBar: size.width <= ScreenSize.medium
          ? AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.drag_handle),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              }),
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
          : AppBarWidget(
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
