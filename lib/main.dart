import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Interfaz/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Sprint3_Ciclo4',
      options: FirebaseOptions(
          apiKey: "AIzaSyA3aa2YDHmB3Xjg_PtDQ7QmYIpS7_vyZ8M",
          authDomain: "sprint3-ciclo4.firebaseapp.com",
          projectId: "sprint3-ciclo4",
          storageBucket: "sprint3-ciclo4.appspot.com",
          messagingSenderId: "258510401312",
          appId: "1:258510401312:web:e548b9ccad5ade01bcb145",
          measurementId: "G-PSD9ZPEFQH"));
  runApp(const MyApp());
}
