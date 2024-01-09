import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/providers/state/auth_state.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/repo/auth_repo.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state, this._authRepository);
  final AuthRepository _authRepository;

  Future<bool> register(
      {required String email,
      required String userName,
      required String password}) async {
    state = state.copyWith(isLoading: true);
    try {
      User? user = await _authRepository.createUserWithEmailAndPassword(
          email: email, password: password, userName: userName);
      if (user != null) {
        await user.updateDisplayName(userName);
        state = state.copyWith(isLoading: false, isAuth: true);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> signInWithGoogle() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        state = state.copyWith(
          isLoading: false,
          isAuth: true,
        );
        return true;
      } else {
        state = state.copyWith(
            isLoading: false, error: "Cannot retrieve user data");
        return false;
      }
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message.toString());
    }
    return false;
  }

  Future<bool> signOut() async {
    try {
      await _authRepository.signOut();
      state = state.copyWith(
        isAuth: false,
        error: null,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
