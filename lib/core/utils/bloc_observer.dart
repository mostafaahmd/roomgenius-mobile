import 'package:bloc/bloc.dart';

import 'logger.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.error('Bloc error in ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    AppLogger.debug('Bloc closed: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
