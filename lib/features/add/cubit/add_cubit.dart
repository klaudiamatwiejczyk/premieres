import 'package:bloc/bloc.dart';
import 'package:premieres/app/core/enums.dart';
import 'dart:async';
import 'package:premieres/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository, this._uselessfactsRepository,
      this._uselessfactsModel)
      : super(const AddState());

  final ItemsRepository _itemsRepository;
  final UselessfactsRepository _uselessfactsRepository;
  final UselessfactsModel _uselessfactsModel;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      await _itemsRepository.add(title, imageURL, releaseDate);
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}



class UselessfactsRepository {}
