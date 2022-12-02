import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sprint3_ciclo4/Controladores/autenticacion.dart';
import 'package:sprint3_ciclo4/Interfaz/mensajes.dart';

class interfaz_chat extends StatefulWidget {
  const interfaz_chat({super.key});

  @override
  State<interfaz_chat> createState() => _interfaz_chatState();
}

final mensaje = TextEditingController();
final firebase = FirebaseFirestore
    .instance; //estas son las variables instanciadas de la libreria firebase para realizar la conexion con la base de datos en Firebase

class _interfaz_chatState extends State<interfaz_chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((authentication().usuarios?.email)
            .toString()), // se trae el metodo usuarios y de ahi se trae el dato de mail, asi mismo lo convierte a String
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: mensajes()), //se llama a la pagina de mensajes.dart
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensaje,
                    decoration:
                        InputDecoration(hintText: "Escriba su mensaje:...."),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        // la condicion hace que no se almacenen mensajes vacios
                        firebase.collection("Chat").doc().set({
                          //"chat" es el nombre de la colección
                          // se crea la base de datos en formato .json para enviar a firebase, tener en cuenta que la base de datos en firebase no es relacional, por lo que no es SQL
                          "mensaje": mensaje.text,
                          "tiempo": DateTime.now(),
                          "email": (authentication().usuarios?.email).toString()
                        });
                      }
                      mensaje.clear();
                    },
                    icon: Icon(Icons.send))
              ],
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  authentication().CerrarSesion();
                },
                icon: Icon(Icons.logout_outlined),
                label: Text("Log Off"))
          ],
        ),
      ),
    );
  }
}
