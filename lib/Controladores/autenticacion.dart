import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authentication {
  final FirebaseAuth FireAuthentication =
      FirebaseAuth.instance; // Instanciar la libreria de Firebase
  User? get usuarios => FireAuthentication
      .currentUser; // hace que la variable user tome el valor de currentUser
  Stream<User?> get EstadoLogIn => // Stream son variables de flujo
      FireAuthentication.authStateChanges();

  get context => null; // valida el estado del usuaario

  Future<void> IniciarSesion(
      // funcion para iniciar sesión
      {required String Email,
      required String Password}) async {
    try {
      await FireAuthentication.signInWithEmailAndPassword(
          // se genera una funcion asincronica de autenticacion por email y contraseña
          email: Email,
          password: Password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> CrearUsuario(
      // funcion para iniciar sesión
      {required String Email,
      required String Password}) async {
    try {
      await FireAuthentication.createUserWithEmailAndPassword(
          // se genera una funcion asincronica de de creacion de usuario por mail y contraseña
          email: Email,
          password: Password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> CerrarSesion(
      // funcion para iniciar sesión
      ) async {
    try {
      await FireAuthentication.signOut(
          // se genera una funcion asincronica de cerrar sesión
          );
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
