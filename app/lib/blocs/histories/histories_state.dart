part of 'histories_bloc.dart';

sealed class HistoriesState {}

final class HistoriesInitial extends HistoriesState {
  final List<History> histories;

  HistoriesInitial({required this.histories});
}
