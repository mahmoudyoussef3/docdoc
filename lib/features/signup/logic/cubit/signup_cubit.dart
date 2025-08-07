import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/features/login/data/models/login_response_body.dart';
import 'package:docdoc/features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/features/signup/data/repo/signup_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> emitSignupStates() async {
    emit(SignupLoading());

    final result = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        gender: '0',
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text));
    result.fold(
        (errorHandler) =>
            emit(SignupFailure(errorHandler.apiErrorModel.message.toString())),
        (loginResponseBody) => emit(SignupSuccess(loginResponseBody)));
  }
}
