import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> sgininwithemail({
    required String emailAddress,
    required String password,
  }) async {
    print("sgininwithemail");
    print("emailAddress : $emailAddress");
    print("password : $password");
    emit(SginInLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SginInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SginInFailed(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SginInFailed(error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SginInFailed(error: 'The email address is badly formatted.'));
      } else if (e.code == 'user-not-found') {
        emit(SginInFailed(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SginInFailed(error: 'Wrong password provided.'));
      } else {
        emit(SginInFailed(error: 'Sign in failed: ${e.message}'));
      }
    } catch (e) {
      emit(
          SginInFailed(error: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> sginupwithemail({
    required String emailAddress,
    required String password,
  }) async {
    emit(SginUpLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SginUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SginUpFailed(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SginUpFailed(error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SginUpFailed(error: 'The email address is badly formatted.'));
      } else if (e.code == 'user-not-found') {
        emit(SginUpFailed(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SginUpFailed(error: 'Wrong password provided.'));
      } else {
        emit(SginUpFailed(error: 'Sign in failed: ${e.message}'));
      }
    } catch (e) {
      print(e);
      emit(
        SginUpFailed(
          error: ("error : ${e.toString()}"),
        ),
      );
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);

    //i need to decribe the state
    print(change);
    //i need to decribe the current state
    print(change.currentState);
    //i need to decribe the next state
    print(change.nextState);
  }
}
