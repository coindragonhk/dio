import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../content_main_drawer.dart';

@LazySingleton()
class ContentMainDrawerCubit extends Cubit<ContentMainDrawerState> {
  //FirebaseAuthRepository authRepository = GetIt.I<FirebaseAuthRepository>();

  //User? get currentUserLogged => authRepository.currentUserLogged();

  int? get selectedDrawerIndex => listSelectedIndex.lastOrNull;
  List<int?> listSelectedIndex = [0];

  ContentMainDrawerCubit() : super(ContentMainDrawerInitial()) {
    // TODO
  }

  void refreshDrawer() {
    emit(ContentMainDrawerLoading());
    emit(ContentMainDrawerInitial());
  }

  void selectDrawerIndex(
      {int? index,
      bool isBack = false,
      bool isReplaceLast = false,
      bool isBackToToFirst = false,
      bool isDrawer = true}) {
    emit(ContentMainDrawerLoading());
    //logger.d("$index - $isBack   $isReplaceLast   $isBackToToFirst");
    if (isBackToToFirst) {
      listSelectedIndex.clear();
      listSelectedIndex.add(0);
      emit(const ContentMainDrawerSelectIndexState(index: 0));
      return;
    }
    if (isBack) {
      if (listSelectedIndex.isNotEmpty) listSelectedIndex.removeLast();
      if (listSelectedIndex.isEmpty) listSelectedIndex.add(0);
      // logger.d(listSelectedIndex);
      emit(ContentMainDrawerInitial());
      return;
    }
    // if (isReplaceLast) {
    //   if (listSelectedIndex.isNotEmpty) {
    //     listSelectedIndex.removeLast();
    //   }
    //   listSelectedIndex.add(index);
    //   emit(ContentMainDrawerSelectIndexState(index: index));
    //   return;
    // }
    if (index != null && index != selectedDrawerIndex) {
      if (!isDrawer) {
        listSelectedIndex.removeLast();
      }
      listSelectedIndex.add(index);
      // logger.d(listSelectedIndex);
      emit(ContentMainDrawerSelectIndexState(index: index));
    } else {
      if (!isDrawer) {
        listSelectedIndex.removeLast();
      }
      listSelectedIndex.add(index);
      emit(ContentMainDrawerInitial());
    }
  }
}
