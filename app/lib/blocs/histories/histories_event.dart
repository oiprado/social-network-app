part of 'histories_bloc.dart';

@immutable
sealed class HistoriesEvent {}

class LoadHistories extends HistoriesEvent {
  final int page;
  final int size;

  LoadHistories({required this.page, required this.size});
}
