import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit submit: $state');
  }

  void usernameChanged(String value) {
    final username = UserName.dirty(value);

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password])
      )
    );
  }

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value
      )
    );
  }

  void passwordChanged(String value) {

    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, password])
      )
    );
  }



}
