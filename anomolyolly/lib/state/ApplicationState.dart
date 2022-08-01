import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../data/UserRepos.dart';
import '../firebase_options.dart';
import '../screens/authentication.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }


  StreamSubscription<QuerySnapshot>? _userReposSubscription;
  UserRepos? _userRepos;
  UserRepos? get userRepos => _userRepos;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        _userReposSubscription = FirebaseFirestore.instance
            .collection('userWatchedRepos')
            .snapshots()
            .listen((snapshot) {
              _userRepos = null;
              if(snapshot.docs.isNotEmpty) {
                snapshot.docs.forEach((document) {
                  if(document.data()['userId'].toString() == (FirebaseAuth.instance.currentUser!.uid)) {
                    List<dynamic>? dynamicReposList = document.data()['repoIdList'];
                    List<int>? userReposList = dynamicReposList?.cast<int>();
                    _userRepos = UserRepos(userReposList);
                  }
                });
              }
          notifyListeners();
        });
      } else {
        _loginState = ApplicationLoginState.emailAddress;
        _userReposSubscription = null;
        _userReposSubscription?.cancel();
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.emailAddress;
  ApplicationLoginState get loginState => _loginState;

  Future<DocumentReference> addSavedRepos(List<int> repos) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('userWatchedRepos')
        .add(<String, dynamic>{
      'repoIdList': repos,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
      String email,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      var methods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }
}