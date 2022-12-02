import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sprint3_ciclo4/Controladores/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  // metodo para realizar la consulta a la base de datos de Firebase
  Stream<QuerySnapshot> respuesta_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          try {
            return ListView.builder(
              itemCount: respuesta.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                    child: Card(
                  color: (authentication().usuarios?.email).toString() ==
                          respuesta.data!.docs[index].get("email")
                      ? Colors.green
                      : Colors.greenAccent,
                  child: ListTile(
                      title: Text(respuesta.data!.docs[index].get("mensaje"),
                          textAlign: (authentication().usuarios?.email)
                                      .toString() ==
                                  respuesta.data!.docs[index].get("email")
                              ? TextAlign.right
                              : TextAlign
                                  .left), // en get, se coloca el nombre del titulo del dato que se esta obteniendo del JSON
                      subtitle: Text(respuesta.data!.docs[index].get("email"),
                          textAlign:
                              (authentication().usuarios?.email).toString() ==
                                      respuesta.data!.docs[index].get("email")
                                  ? TextAlign.right
                                  : TextAlign.left)),
                ));
              },
            );
          } catch (e) {
            return Center(child: CircularProgressIndicator());
          }
          ;
        },
        stream: respuesta_consulta);
  }
}
