import 'package:origemjhanpoll_github_io/feature/models/response.dart';

abstract class PortifolioState {}

class PortifolioInitial extends PortifolioState {}

class PortifolioLoading extends PortifolioState {}

class PortifolioLoaded extends PortifolioState {
  final Response model;
  PortifolioLoaded(this.model);
}

class PortifolioError extends PortifolioState {
  final String message;
  PortifolioError(this.message);
}
