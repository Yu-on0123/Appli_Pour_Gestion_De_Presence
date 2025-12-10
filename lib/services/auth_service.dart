import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Inscription
  Future<User?> register(String name, String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Ajouter displayName
    await cred.user?.updateDisplayName(name);
    return cred.user;
  }

  // Connexion
  Future<User?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  // Déconnexion
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Utilisateur courant
  User? get currentUser => _auth.currentUser;
}
