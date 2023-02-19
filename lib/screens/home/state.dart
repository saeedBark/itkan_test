
abstract class BookState {}

class InitialBookState extends BookState {}

class LoadingHomeDataState extends BookState {}

class BookSuccessHomeDataState extends BookState {}

class ShopErrorHomeDataState extends BookState {
  ShopErrorHomeDataState(String string);
}

