part of 'add_cubit.dart';

class AddState {
  const AddState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
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
