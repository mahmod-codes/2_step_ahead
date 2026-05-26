import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/auth_service.dart';
import 'app_providers.dart';

class AuthController extends StateNotifier<AsyncValue<AuthFormError?>> {
  AuthController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<bool> signIn(String email, String password) {
    return _submit(() => ref.read(authServiceProvider).signIn(email, password));
  }

  Future<bool> register(String email, String password) {
    return _submit(() => ref.read(authServiceProvider).register(email, password));
  }

  Future<bool> _submit(Future<Object> Function() action) async {
    state = const AsyncLoading();
    try {
      await action();
      ref.invalidate(localUserProvider);
      state = const AsyncData(null);
      return true;
    } on AuthFailure catch (error) {
      state = AsyncData(error.errors);
      return false;
    } on Object catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return false;
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthFormError?>>((ref) {
  return AuthController(ref);
});
