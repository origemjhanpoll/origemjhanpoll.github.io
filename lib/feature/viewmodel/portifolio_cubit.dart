import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/feature/services/remote_service.dart';
import 'package:origemjhanpoll_github_io/feature/viewmodel/portifolio_state.dart';

class PortifolioCubit extends Cubit<PortifolioState> {
  final RemoteService remoteService;

  PortifolioCubit(this.remoteService) : super(PortifolioInitial());

  Future<void> fetchPortifolio() async {
    emit(PortifolioLoading());
    try {
      final data = await remoteService.fetchPortifolio();
      emit(PortifolioLoaded(data));
    } catch (e) {
      emit(PortifolioError(e.toString()));
    }
  }
}
