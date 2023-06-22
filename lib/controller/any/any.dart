import 'package:bloc/bloc.dart';

class FocusedCubit extends Cubit<DateTime> {
  FocusedCubit() : super(DateTime.now());

  void setDate(DateTime date) {
    emit(date);
  }
}

class SelectedCubit extends Cubit<DateTime> {
  SelectedCubit() : super(DateTime.now());

  void setDate(DateTime date) {
    emit(date);
  }
}
