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


// class AddFactsCubit extends Cubit<AddState> {
//   final UselessFactsRepository _repository;
//   static const String _baseUrl = 'https://uselessfacts.jsph.pl';
//   AddFactsCubit(this._repository) : super(AddInitial());

//   Future<void> start() async {
//     try {
//       final fact = await _repository.getUselessFact();
//       emit(AddLoaded(fact));
//     } catch (error) {
//       emit(AddError('Failed to load fact: $error'));
//     }
//   }

//   Future<String> getUselessFact() async {
//     final response = await _repository.get(Uri.parse('$_baseUrl/random'));
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse['data'];
//     } else {
//       throw Exception('Failed to load fact');
//     }
//   }

  // Future<void> addFact() async {
  //   emit(AddState.loading());
  //   try {
  //     final fact = await UselessFactsApiClient().getTodayFact();
  //     final addedFact = await _uselessFactsRepository.addFact(fact);
  //     emit(AddState.success(addedFact));
  //   } catch (e) {
  //     emit(AddState.error());
  //   }
  // }

