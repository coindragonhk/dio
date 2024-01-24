abstract class SubMenuState {
  const SubMenuState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class SubMenuInitial extends SubMenuState {
  @override
  String toString() => 'SubMenuInitial';
}

class SubMenuUnInitial extends SubMenuState {
  @override
  String toString() => 'SubMenuUnInitial';
}

class SubMenuLoading extends SubMenuState {
  @override
  String toString() => 'SubMenuLoading';
}

class SubMenuSuccess extends SubMenuState {
  final String? message;

  const SubMenuSuccess({this.message});

  @override
  String toString() => 'SubMenuSuccess { message: $message }';
}

class SubMenuFailure extends SubMenuState {
  final String error;

  const SubMenuFailure(this.error);

  @override
  String toString() => 'SubMenuFailure { error: $error }';
}

class SubMenuJumpToPosition extends SubMenuState {
  final double position;

  const SubMenuJumpToPosition(this.position);

  @override
  String toString() => 'SubMenuJumpToPosition';
}