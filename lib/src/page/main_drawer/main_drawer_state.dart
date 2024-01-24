abstract class MainDrawerState {
  const MainDrawerState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class MainDrawerInitial extends MainDrawerState {
  @override
  String toString() => 'MainDrawerInitial';
}

class MainDrawerUnInitial extends MainDrawerState {
  @override
  String toString() => 'MainDrawerUnInitial';
}

class MainDrawerLoading extends MainDrawerState {
  @override
  String toString() => 'MainDrawerLoading';
}

class MainDrawerSuccess extends MainDrawerState {
  final String? message;

  const MainDrawerSuccess({this.message});

  @override
  String toString() => 'MainDrawerSuccess { message: $message }';
}

class MainDrawerFailure extends MainDrawerState {
  final String error;

  const MainDrawerFailure(this.error);

  @override
  String toString() => 'MainDrawerFailure { error: $error }';
}