part of 'entry_bloc.dart';

@immutable
class EntryState {}

final class EntryInitial extends EntryState {
  final EntryResponse response;
  EntryInitial(this.response);
}
