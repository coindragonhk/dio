import 'package:flutter_bloc/flutter_bloc.dart';
import '../sub_menu.dart';

class SubMenuCubit extends Cubit<SubMenuState> {
  SubMenuCubit() : super(SubMenuInitial()) {
    // TODO
  }

  void refreshSubMenu() {
    emit(SubMenuLoading());
    emit(const SubMenuSuccess());
  }

  void jumpToPosition(double value) {
    emit(SubMenuInitial());
    emit(SubMenuJumpToPosition(value));
  }
}