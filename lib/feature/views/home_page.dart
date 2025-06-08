import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/widgets/background_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/float_appbar_widget.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/about_widget.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/initial_widget.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/projects_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();

  final scrollController = ScrollController();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Durations.long2,
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToIndex(int index) {
    switch (index) {
      case 0:
        scrollTo(homeKey);
        break;
      case 1:
        scrollTo(aboutKey);
        break;
      case 2:
        scrollTo(projectsKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundWidget(color: theme.primaryColor.withValues(alpha: 0.1)),
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverFillRemaining(child: InitialWidget(key: homeKey)),
              SliverToBoxAdapter(child: AboutWidget(key: aboutKey)),
              SliverToBoxAdapter(child: ProjectsWidget(key: projectsKey)),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: SpacingSize.medium),
        child: FloatAppbarWidget(onPage: scrollToIndex),
      ),
    );
  }

  ThemeData get theme => Theme.of(context);
}
