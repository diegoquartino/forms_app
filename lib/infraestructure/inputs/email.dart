import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  
  // La dejamos statica por si necesitamos compatir la expresion con alguna otra clase
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);


  //> Hacemos un getter para obtener el mensaje de error si existe uno
  String? get errorMessage {
    if( isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) return 'No tiene foramato de correo';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {

    if (value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)){
      return EmailError.format;
    }

    return null;
  }
}