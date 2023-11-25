part of 'entry_bloc.dart';

@immutable
class EntryEvent {}

class LoadEntries extends EntryEvent {
  final int page;
  final int size;

  LoadEntries({required this.page, required this.size});
}
