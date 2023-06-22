import 'package:bloc/bloc.dart';
import 'package:frontend/model/view_setting.dart';

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

class ViewSettingCubit extends Cubit<ViewSetting> {
  ViewSettingCubit() : super(ViewSetting());

  setSetting(ViewSetting setting) {
    emit(setting);
  }
}
