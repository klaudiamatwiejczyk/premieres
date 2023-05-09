import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:premieres/app/core/enums.dart';
import 'dart:async';
import 'package:premieres/repositories/items_repository.dart';
import 'package:premieres/repositories/uselessfacts_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(
    this._itemsRepository,
    this._uselessfactsRepository,
  ) : super(const AddState());

  final ItemsRepository _itemsRepository;
  final UselessFactsRepository _uselessfactsRepository;
  

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

class AddFactsCubit extends Cubit<AddState> {
  final UselessFactsRepository _repository;
  static const String _baseUrl = 'https://uselessfacts.jsph.pl';
  AddFactsCubit(this._repository) : super(AddInitial());
  

  Future<void> start() async {
    try {
      final fact = await _repository.getUselessFact();
      emit(AddLoaded(fact));
    } catch (error) {
      emit(AddError('Failed to load fact: $error'));
    }
  }

  Future<String> getUselessFact() async {
    final response = await _repository.get(Uri.parse('$_baseUrl/random'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['data'];
    } else {
      throw Exception('Failed to load fact');
      
    }
  }
  }

