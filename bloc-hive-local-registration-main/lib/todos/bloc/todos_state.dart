// ignore_for_file: prefer_const_constructors_in_immutables

part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoadedState extends TodosState {
  final List<Task> tasks;
  final String username;

  TodosLoadedState(
    this.tasks,
    this.username,
  );

  @override
  List<Object?> get props => [
        tasks,
        username,
      ];
}
