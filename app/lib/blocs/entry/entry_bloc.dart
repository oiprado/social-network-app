import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quipu/model/entry/entry_response.dart';

part 'entry_event.dart';
part 'entry_state.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final String _baseUrl = "daa8-181-51-228-152.ngrok-free.app";
  final String _segment = "/entry";

  EntryBloc() : super(EntryState()) {
    on<LoadEntries>((event, emit) async {
      final queryParameters = {
        "page": '${event.page}',
        "size": '${event.size}'
      };

      final url = Uri.https(_baseUrl, _segment, queryParameters);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var entryResponse = EntryResponse.fromRawJson(response.body);
        print("invoco servicio");
        emit(EntryInitial(entryResponse));
      }
    });
  }
}
