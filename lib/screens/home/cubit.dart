
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itkan_test/dio/dio.dart';
import 'package:itkan_test/models/home_book_model.dart';
import 'package:itkan_test/screens/home/state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(InitialBookState());

  static BookCubit get(context) => BlocProvider.of(context);

 late  HomeDataModel  homeModel;

  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHolper.getData().then((value) {
      //  print(value.data);
      homeModel = HomeDataModel.fromJson(value.data);
      print("saeed");
      print(homeModel.results);

      homeModel.results.forEach((element) {
        // favorites.addAll({
        //   element.id!: element.inFavorites!,
        // });
      });
      // print(favorites.toString());
      emit(BookSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }
}
