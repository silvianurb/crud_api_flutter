import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/datasource/remote_datasource.dart';
import 'package:flutter_application_2/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource remoteDataSource;
  UserBloc({required this.remoteDataSource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await remoteDataSource.getUsers();
        emit(UserLoaded(result.data));
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });
  }
}
