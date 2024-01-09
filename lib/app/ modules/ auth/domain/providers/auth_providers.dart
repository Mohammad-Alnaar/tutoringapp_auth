import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/providers/controller/auth_controller.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/providers/controller/text_form_provider.dart';

import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/providers/state/auth_state.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/repo/auth_repo.dart';

final authFormController =
    ChangeNotifierProvider((ref) => MyAuthFormController());

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  ref.read(authControllerProvider);
  return authRepository.authStateChanges;
});
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(
      AuthState(),
      ref.watch(authRepositoryProvider),
    );
  },
);
