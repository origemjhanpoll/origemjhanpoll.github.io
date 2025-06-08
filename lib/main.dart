import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:origemjhanpoll_github_io/feature/app.dart';
import 'package:origemjhanpoll_github_io/feature/services/remote_service.dart';
import 'package:origemjhanpoll_github_io/feature/viewmodel/portifolio_cubit.dart';

void main() {
  final remoteService = RemoteService(http.Client());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<PortifolioCubit>(
          create: (context) => PortifolioCubit(remoteService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
