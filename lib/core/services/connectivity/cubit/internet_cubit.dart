import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _internetStreamSubscription;
  InternetCubit() : super(InternetInitial());

  void monitoringInternetState() {
    _internetStreamSubscription =
        Connectivity().onConnectivityChanged.listen((event) {
      log('InternetState: $event');
      if (event.contains(ConnectivityResult.wifi) ||
          event.contains(ConnectivityResult.mobile)) {
        emit(ConnectedState());
      } else {
        emit(NotConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _internetStreamSubscription?.cancel();
    return super.close();
  }
}
