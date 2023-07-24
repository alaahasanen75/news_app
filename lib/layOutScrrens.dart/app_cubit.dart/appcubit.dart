import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chared_prefrances.dart';
import 'appstate.dart';

class appCubit extends Cubit<appStates> {
  appCubit() : super(AppIniState());

  static appCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;

      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CachHelper.PutData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
