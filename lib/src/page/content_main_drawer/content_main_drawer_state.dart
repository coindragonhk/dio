abstract class ContentMainDrawerState {
  const ContentMainDrawerState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class ContentMainDrawerInitial extends ContentMainDrawerState {
  @override
  String toString() => 'ContentMainDrawerInitial';
}

class ContentMainDrawerUnInitial extends ContentMainDrawerState {
  @override
  String toString() => 'ContentMainDrawerUnInitial';
}

class ContentMainDrawerLoading extends ContentMainDrawerState {
  @override
  String toString() => 'ContentMainDrawerLoading';
}

class ContentMainDrawerSuccess extends ContentMainDrawerState {
  final String? message;

  const ContentMainDrawerSuccess({this.message});

  @override
  String toString() => 'ContentMainDrawerSuccess { message: $message }';
}

class ContentMainDrawerFailure extends ContentMainDrawerState {
  final String error;

  const ContentMainDrawerFailure(this.error);

  @override
  String toString() => 'ContentMainDrawerFailure { error: $error }';
}

class ContentMainDrawerSelectIndexState extends ContentMainDrawerState {
  final int? index;

  const ContentMainDrawerSelectIndexState({this.index});

  @override
  String toString() => 'ContentMainDrawerSelectIndexState { index: $index }';
}