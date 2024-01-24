import 'package:dtg_web_admin/src/utils/enum.dart';

abstract class MainState {
  const MainState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  @override
  String toString() => 'MainInitial';
}

class MainUnInitial extends MainState {
  @override
  String toString() => 'MainUnInitial';
}

class MainLoading extends MainState {
  @override
  String toString() => 'MainLoading';
}

class MainSuccess extends MainState {
  final String? message;

  const MainSuccess({this.message});

  @override
  String toString() => 'MainSuccess { message: $message }';
}

class MainFailure extends MainState {
  final String error;

  const MainFailure(this.error);

  @override
  String toString() => 'MainFailure { error: $error }';
}

class MainLoadIpSuccess extends MainState {
  @override
  String toString() => 'MainLoadIpSuccess';
}

class MainGetDataSuccess extends MainState {
  @override
  String toString() => 'MainGetWalletSuccess';
}

class ScrollToSectionState extends MainState {
  final SectionId sectionId;

  const ScrollToSectionState({required this.sectionId});

  @override
  String toString() => 'ScrollToSectionState { sectionId: $sectionId }';
}

class MainStartRefresh extends MainState {
  @override
  String toString() => 'MainStartRefresh';
}

class MainRefreshedSuccess extends MainState {
  @override
  String toString() => 'MainRefreshedSuccess';
}

class SwitchBottomNavigationBar extends MainState {
  final BottomNavigationType? type;

  SwitchBottomNavigationBar({required this.type});

  @override
  String toString() => 'SwitchBottomNavigationBar';
}

/*
class MainShowPushNotiLocalState extends MainState {
  final RemoteMessage message;
  final String title;
  final String body;

  const MainShowPushNotiLocalState(
      {required this.message, required this.body, required this.title});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MainShowPushNotiLocalState';
}*/

class MainNavigateNotificationState extends MainState {
  const MainNavigateNotificationState();

  @override
  String toString() => 'MainNavigateNotificationState';
}

class ShowAlertNoticeState extends MainState {
  final String title;
  final String content;

  const ShowAlertNoticeState({required this.title, required this.content});

  @override
  String toString() => 'ShowAlertNoticeState';
}

class ShowFullPageAlertNoticeState extends MainState {
  final String title;
  final String content;

  const ShowFullPageAlertNoticeState(
      {required this.title, required this.content});

  @override
  String toString() => 'ShowFullPageAlertNoticeState';
}
