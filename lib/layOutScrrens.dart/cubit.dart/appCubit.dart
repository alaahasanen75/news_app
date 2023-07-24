import 'package:flutter/material.dart';
import 'package:flutter_application_2/layOutScrrens.dart/chared_prefrances.dart';
import 'package:flutter_application_2/layOutScrrens.dart/search_screen.dart';
import 'package:flutter_application_2/layOutScrrens.dart/cubit.dart/state.dart';
import 'package:flutter_application_2/layOutScrrens.dart/dio_helper.dart';
import 'package:flutter_application_2/layOutScrrens.dart/scinceScreen.dart';
import 'package:flutter_application_2/layOutScrrens.dart/sportScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../BusinessScreen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
  ];
  List<Widget> screens = [
    Business(), Sports(), Science(),
    // Settings()
  ];

  void changeBottonNav(int index) {
    index = currentIndex;
    // if (index == 1) getSports();
    // if (index == 2) getScience();

    emit(ChangeBottomNaveState());
  }

  List<dynamic> business = [];
  void getbusiness() {
    emit(loadingGetDataState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'f8fcf96ebefa4fbfa62ef46fc85c3aaa',
    }).then((value) {
      business = value.data['articles'];
      emit(getDataSucssesfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(getDataErorrState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(loadingGetSportsState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'f8fcf96ebefa4fbfa62ef46fc85c3aaa',
      }).then((value) {
        sports = value.data['articles'];
        emit(GetSportsSucssesfulyState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsErorrState(error.toString()));
      });
    } else {
      emit(GetSportsSucssesfulyState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(loadingGetScienceState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'f8fcf96ebefa4fbfa62ef46fc85c3aaa',
      }).then((value) {
        science = value.data['articles'];
        emit(GetScienceSucssesfulyState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceErorrState(error.toString()));
      });
    } else {
      emit(loadingGetScienceState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(loadingGetSearchState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'f8fcf96ebefa4fbfa62ef46fc85c3aaa',
    }).then((value) {
      search = value.data['articles'];
      emit(GetSearchSucssesfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErorrState(error.toString()));
    });
  }
}
