import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/widgets/drawer_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/app_bar_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/about_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/experiences_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experiencesKey = GlobalKey();
  final projectsKey = GlobalKey();

  void _onMenuClick(int value) {
    switch (value) {
      case 0:
        Scrollable.ensureVisible(
          homeKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 1:
        Scrollable.ensureVisible(
          aboutKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 2:
        Scrollable.ensureVisible(
          experiencesKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 3:
        Scrollable.ensureVisible(
          projectsKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;

      default:
        throw Exception('Invalid menu value');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final theme = Theme.of(context);
    return Scaffold(
      drawer: !isScreenMedium
          ? DrawerWidget(onMenuClick: (value) => _onMenuClick(value))
          : null,
      appBar: !isScreenMedium
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
              onMenuClick: (value) => _onMenuClick(value),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              HomeWidget(key: homeKey),
              AboutWidget(key: aboutKey),
              // ExperiencesWidget(key: experiencesKey),
              // ProjectsWidget(key: projectsKey),
            ],
          ),
        ),
      ),
    );
  }
}
