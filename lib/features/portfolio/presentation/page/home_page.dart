import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/widgets/drawer_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/float_appbar_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/about_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/experiences_widget.dart';
import 'package:origemjhanpoll_github_io/features/portfolio/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experiencesKey = GlobalKey();
  final projectsKey = GlobalKey();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  void _onPage(int page) {
    pageController.animateToPage(
      page,
      duration: Durations.long2,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(onPage: (page) => _onPage(page)),
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatAppbarWidget(onPage: _onPage),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          HomeWidget(key: homeKey),
          AboutWidget(key: aboutKey),
          ExperiencesWidget(key: experiencesKey),
          // ProjectsWidget(key: projectsKey),
        ],
      ),
    );
  }
}
