import 'package:flutter/material.dart';
import 'package:sprint3_ciclo4/Controladores/autenticacion.dart';

class inicio_sesion extends StatefulWidget {
  const inicio_sesion({super.key});

  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
}

final email =
    TextEditingController(); // se instancia el controlador para acceder a los datos del TextFile
final Contrasena = TextEditingController();

class _inicio_sesionState extends State<inicio_sesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingreso - Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/thumbnails/002/135/986/small/chat-wing-logo-design-illustration-free-vector.jpg")),
              ),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Correo Electronico",
                  suffixIcon: Icon(Icons.email)),
            ),
            TextField(
              obscureText:
                  true, // no permite que se vea el texto ingresado en la contraseña
              controller: Contrasena,
              decoration: InputDecoration(
                  hintText: "Contraseña", suffixIcon: Icon(Icons.key)),
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  authentication().IniciarSesion(
                      Email: email.text, Password: Contrasena.text);
                }, // se llama al metodo de firebase de iniciar sesion creado en el archivo autenticación
                icon: Icon(Icons.logout_outlined),
                label: Text("Sign in")),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  authentication().CrearUsuario(
                      Email: email.text, Password: Contrasena.text);
                },
                icon: Icon(Icons.person_add_alt),
                label: Text("Register"))
          ],
        ),
      ),
    );
  }
}
