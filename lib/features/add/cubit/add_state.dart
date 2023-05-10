part of 'add_cubit.dart';

class AddState {
  final bool saved;
  final String? errorMessage;
  final String? uselessFact;

  const AddState({
    this.saved = false,
    this.errorMessage,
    this.uselessFact,
  });
}

class AddInitial extends AddState {}

class AddLoaded extends AddState {
  final String fact;

  const AddLoaded(this.fact) : super(uselessFact: fact);
}

class AddError extends AddState {
  final String error;

  const AddError(this.error) : super(errorMessage: error);
}

class Uselessfacts {
  const Uselessfacts({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final UselessfactsModel? model;
  final Status status;
  final String? errorMessage;
}

class UselessfactsModel {}
