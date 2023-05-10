import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:premieres/app/core/enums.dart';
import 'dart:async';
import 'package:premieres/repositories/items_repository.dart';
import 'package:premieres/repositories/uselessfacts_repository.dart';
import 'package:http/http.dart' as http;

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  final ItemsRepository _itemsRepository;
  final UselessFactsRepository _uselessfactsRepository;

  AddCubit(
    this._itemsRepository,
    this._uselessfactsRepository,
  ) : super(const AddState());

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

  Future<String> fetchUselessFact() async {
    final response = await http.get(Uri.parse(
        'https://uselessfacts.jsph.pl/api/v2/facts/today?language=en'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['text'];
    } else {
      throw Exception('Failed to fetch useless fact');
    }
  }

 
}

