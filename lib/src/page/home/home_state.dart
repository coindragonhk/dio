abstract class HomeState {
  const HomeState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  String toString() => 'HomeInitial';
}

class HomeUnInitial extends HomeState {
  @override
  String toString() => 'HomeUnInitial';
}

class HomeLoading extends HomeState {
  @override
  String toString() => 'HomeLoading';
}

class HomeSuccess extends HomeState {
  final String? message;

  const HomeSuccess({this.message});

  @override
  String toString() => 'HomeSuccess { message: $message }';
}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure(this.error);

  @override
  String toString() => 'HomeFailure { error: $error }';
}

class HomeLoadIpSuccess extends HomeState {
  @override
  String toString() => 'HomeLoadIpSuccess';
}

class HomeForceLogOut extends HomeState {
  @override
  String toString() => 'HomeForceLogOut';
}

class HomeGetDataSuccess extends HomeState {
  @override
  String toString() => 'HomeGetWalletSuccess';
}

/*
class ScrollToSectionState extends HomeState {
  final SectionId sectionId;

  const ScrollToSectionState({required this.sectionId});

  @override
  String toString() => 'ScrollToSectionState { sectionId: $sectionId }';
}*/

class HomeStartRefresh extends HomeState {
  @override
  String toString() => 'HomeStartRefresh';
}

class HomeRefreshedSuccess extends HomeState {
  @override
  String toString() => 'HomeRefreshedSuccess';
}

class HomeGetVoucherDetailError extends HomeState {
  @override
  String toString() => 'HomeGetVoucherDetailError';
}

class HomeGetMyVoucherSuccess extends HomeState {
  @override
  String toString() => 'HomeGetMyVoucherSuccess';
}

/*
class HomeGetVoucherDetailSuccess extends HomeState {
  final Voucher voucher;
  final OptionsData optionsData;

  const HomeGetVoucherDetailSuccess(
      {required this.voucher, required this.optionsData});

  @override
  String toString() => 'HomeGetVoucherDetailSuccess';
}*/
