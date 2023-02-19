
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itkan_test/dio/dio.dart';
import 'package:itkan_test/screens/search/state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(SearchBookLoadingSearchState());
    search = [];
    DioHolper.getData().then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['result'];
      print(search[0]['title']);
      emit(SearchBookGetSearchsuccessStste());
    }).catchError((error) {
      print(error.toString());
      emit(SearchBookGetSearchErrorStste(error.toString()));
    });
  }

}