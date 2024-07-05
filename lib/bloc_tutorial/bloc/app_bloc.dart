import 'package:bloc/bloc.dart';
import 'package:practice/bloc_tutorial/api/notes_api.dart';
import 'package:practice/bloc_tutorial/bloc/actions.dart';
import 'package:practice/bloc_tutorial/bloc/app_state.dart';
import 'package:practice/bloc_tutorial/models/models.dart';

import '../api/login_api.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({required this.loginApi, required this.notesApi})
      : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        emit(
          const AppState(
            isLoading: true,
            loginError: null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );

        //log the user in

        final loginHandle = await loginApi.login(
          email: event.email,
          password: event.password,
        );
        AppState(
          isLoading: false,
          loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
          loginHandle: loginHandle,
          fetchedNotes: null,
        );
      },
    );

    on<LoadNotesAction>((event, emit) async {
      emit(
        AppState(
          isLoading: true,
          loginError: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );
      //get the login handle
      final loginHandle = state.loginHandle;
      if (loginHandle != const LoginHandle.fooBar()) {
        emit(
          AppState(
            isLoading: false,
            loginError: LoginErrors.invalidHandle,
            loginHandle: state.loginHandle,
            fetchedNotes: null,
          ),
        );
        return;
      }
      //we have a valid login handle amd want to fetch notes
      final notes = notesApi.getNotes(loginHandle: loginHandle!);
      emit(
        AppState(
          isLoading: false,
          loginError: null,
          loginHandle: loginHandle,
          fetchedNotes: notes,
        ),
      );
    });
  }
}
