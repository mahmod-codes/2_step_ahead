import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/auth_service.dart';
import 'app_providers.dart';

class AuthController extends StateNotifier<AsyncValue<AuthFormError?>> {
  AuthController(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<bool> signIn(String email, String password) {
    return _submit(() => ref.read(authServiceProvider).signIn(email, password));
  }

  Future<bool> register(String email, String password) {
    return _submit(() => ref.read(authServiceProvider).register(email, password));
  }

  Future<bool> _submit(Future<Object> Function() action) async {
    state = const AsyncValue.loading();
    try {
      await action();
      ref.invalidate(localUserProvider);
      state = const AsyncValue.data(null);
      return true;
    } on AuthFailure catch (error) {
      state = AsyncValue.data(error.errors);
      return false;
    } on Object catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return false;
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthFormError?>>((ref) {
  return AuthController(ref);
});
