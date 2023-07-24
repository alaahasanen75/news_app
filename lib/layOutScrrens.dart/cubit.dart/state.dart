abstract class AppState {}

class InitialState extends AppState {}

class ChangeBottomNaveState extends AppState {}

class loadingGetDataState extends AppState {}

class modeState extends AppState {}

class getDataSucssesfulyState extends AppState {}

class getDataErorrState extends AppState {
  final String erorr;
  getDataErorrState(this.erorr);
}

class loadingGetSportsState extends AppState {}

class GetSportsSucssesfulyState extends AppState {}

class GetSportsErorrState extends AppState {
  final String erorr;
  GetSportsErorrState(this.erorr);
}

class loadingGetScienceState extends AppState {}

class GetScienceSucssesfulyState extends AppState {}

class GetScienceErorrState extends AppState {
  final String erorr;
  GetScienceErorrState(this.erorr);
}

class loadingGetSearchState extends AppState {}

class GetSearchSucssesfulyState extends AppState {}

class GetSearchErorrState extends AppState {
  final String erorr;
  GetSearchErorrState(this.erorr);
}
