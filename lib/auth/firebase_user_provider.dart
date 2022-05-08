import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DecentrabancFirebaseUser {
  DecentrabancFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DecentrabancFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DecentrabancFirebaseUser> decentrabancFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DecentrabancFirebaseUser>(
            (user) => currentUser = DecentrabancFirebaseUser(user));
