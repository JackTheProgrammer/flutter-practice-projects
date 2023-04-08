// ignore_for_file: prefer_const_constructors_in_immutables

part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadTodosEvent extends TodosEvent {
  final String username;

  LoadTodosEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class AddTodoEvent extends TodosEvent {
  final String todoText;

  AddTodoEvent(this.todoText);

  @override
  List<Object?> get props => [todoText];
}

class ToggleTodoEvent extends TodosEvent {
  final String todoTask;

  ToggleTodoEvent(this.todoTask);
  @override
  List<Object?> get props => [todoTask];
}
