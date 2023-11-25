import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quipu/model/history.dart';
import 'package:quipu/model/converter/history_response.dart';

part 'histories_event.dart';
part 'histories_state.dart';

class HistoriesBloc extends Bloc<HistoriesEvent, HistoriesState> {
  final String _baseUrl = '8b79-181-51-228-152.ngrok-free.app';
  final String _segment = "/entry?page=1&size=10";

  HistoriesBloc() : super(HistoriesInitial(histories: [])) {
    on<LoadHistories>((event, emit) async {
      var url = Uri.https(_baseUrl, _segment);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final historyResponse = HistoryResponse.fromRawJson(response.body);
        emit(HistoriesInitial(histories: historyResponse.data));
      }
    });
  }
}
