import 'package:flutter/material.dart';
import 'package:sprint3_ciclo4/Controladores/autenticacion.dart';
import 'package:sprint3_ciclo4/Interfaz/inicio_sesion.dart';
import 'package:sprint3_ciclo4/Interfaz/interfaz_chat.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Mensajeria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authentication().EstadoLogIn,
        builder: (context, respuesta) {
          if (respuesta.hasData) {
            return interfaz_chat();
          } else {
            return inicio_sesion(); //inicio_sesion();
          }
        });
  }
}
