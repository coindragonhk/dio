import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../main_drawer.dart';

class MainDrawerCubit extends Cubit<MainDrawerState> {
  //FirebaseAuthRepository authRepository = GetIt.I<FirebaseAuthRepository>();

  //User? get currentUserLogged => authRepository.currentUserLogged();

  DrawerStep drawerStep = DrawerStep.MAIN;

  MainDrawerCubit() : super(MainDrawerInitial()) {
    // TODO
  }

  void refreshDrawer() {
    emit(MainDrawerLoading());
    emit(MainDrawerInitial());
  }

  void selectDrawerStep({DrawerStep? step}) {
    emit(MainDrawerUnInitial());
    if (step != null) {
      drawerStep = step;
    } else {
      int currentIndexStep = DrawerStep.values.indexOf(drawerStep);
      if (currentIndexStep == DrawerStep.values.length - 1) return;
      drawerStep = DrawerStep.values[currentIndexStep + 1];
    }
    emit(MainDrawerInitial());
  }
}
