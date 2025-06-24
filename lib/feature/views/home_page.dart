import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/widgets/background_widget.dart';
import 'package:origemjhanpoll_github_io/core/widgets/float_appbar_widget.dart';
import 'package:origemjhanpoll_github_io/feature/viewmodel/portifolio_cubit.dart';
import 'package:origemjhanpoll_github_io/feature/viewmodel/portifolio_state.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/about_widget.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/initial_widget.dart';
import 'package:origemjhanpoll_github_io/feature/views/widgets/projects_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final initialKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PortifolioCubit>().fetchPortifolio();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
        scrollTo(initialKey);
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
      body: Stack(
        children: [
          RepaintBoundary(
            child: BackgroundWidget(color: theme.primaryColor.withAlpha(25)),
          ),
          BlocBuilder<PortifolioCubit, PortifolioState>(
            builder: (context, state) {
              if (state is PortifolioLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PortifolioLoaded) {
                return CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverFillRemaining(
                        hasScrollBody: false,
                        child: InitialWidget(
                          key: initialKey,
                          model: state.model.initial,
                        )),
                    SliverToBoxAdapter(
                        child: AboutWidget(
                      key: aboutKey,
                      model: state.model.about,
                    )),
                    SliverFillRemaining(
                        hasScrollBody: false,
                        child: ProjectsWidget(
                          key: projectsKey,
                          model: [
                            ...state.model.projects,
                            ...state.model.projects,
                            ...state.model.projects,
                            ...state.model.projects,
                          ],
                        )),
                  ],
                );
              } else if (state is PortifolioError) {
                return Center(child: Text('Erro: ${state.message}'));
              }
              return LimitedBox();
            },
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
