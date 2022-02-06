import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures([List properties = const <dynamic>[]]);
}

class ReadFailure implements Failures {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
