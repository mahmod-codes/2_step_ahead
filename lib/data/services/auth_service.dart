import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthFormError {
  const AuthFormError({
    this.emailError,
    this.passwordError,
    this.generalError,
  });

  final String? emailError;
  final String? passwordError;
  final String? generalError;

  bool get hasError =>
      emailError != null || passwordError != null || generalError != null;
}

class AuthFailure implements Exception {
  const AuthFailure(this.errors);

  final AuthFormError errors;
}

class AuthService {
  AuthService(this._auth);

  final firebase.FirebaseAuth _auth;

  Stream<firebase.User?> authStateChanges() => _auth.authStateChanges();

  firebase.User? get currentUser => _auth.currentUser;

  Future<firebase.User> signIn(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthFailure(
          AuthFormError(generalError: 'Authentication failed. Please try again.'),
        );
      }
      return user;
    } on firebase.FirebaseAuthException catch (error) {
      throw AuthFailure(_mapFirebaseError(error));
    }
  }

  Future<firebase.User> register(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthFailure(
          AuthFormError(generalError: 'Authentication failed. Please try again.'),
        );
      }
      return user;
    } on firebase.FirebaseAuthException catch (error) {
      throw AuthFailure(_mapFirebaseError(error));
    }
  }

  Future<void> signOut() => _auth.signOut();

  AuthFormError _mapFirebaseError(firebase.FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return const AuthFormError(emailError: 'Invalid email address.');
      case 'user-disabled':
        return const AuthFormError(
          emailError: 'This account has been disabled.',
        );
      case 'user-not-found':
        return const AuthFormError(
          emailError: 'No account found for this email.',
        );
      case 'email-already-in-use':
        return const AuthFormError(
          emailError: 'An account already exists for this email.',
        );
      case 'wrong-password':
        return const AuthFormError(passwordError: 'Incorrect password.');
      case 'weak-password':
        return const AuthFormError(passwordError: 'Password is too weak.');
      case 'network-request-failed':
        return const AuthFormError(
          generalError: 'Network error. Check your connection.',
        );
      default:
        return const AuthFormError(
          generalError: 'Authentication failed. Please try again.',
        );
    }
  }
}
