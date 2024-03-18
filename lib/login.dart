import 'package:flutter/material.dart';
import 'package:flutter_application_1/crearCuenta.dart';
import 'package:flutter_application_1/inicio.dart';
import 'package:flutter_application_1/password.dart';
import 'package:flutter_application_1/registro.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final contraController = TextEditingController();
    final formKey = GlobalKey<FormState>();
  
  List<Usuario> usuarios = [
    Usuario(
      nombre: 'Axel',
      correo: 'axreyes@unah.hn',
      telefono: 99999,
      contrasena: '20202001747',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(key: formKey,
          child: Column(
          children: [
            Center(
              child: FlutterLogo(size: 100),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              maxLength: 30,
              validator: (value) {
                    if (value!.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                   else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Correo electrónico no válido")));
    
                    }
                  
                    return null;
                  },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
           contraField(controller: contraController, labelText: "Contraseña"),
            Row(
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Validar correo y contraseña
                    String email = emailController.text;
                    String contra = contraController.text;
                    bool credencialesValidas = validarCredenciales(email, contra);

                    if (credencialesValidas) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>inicio(emailController.text) ),
                      );
                    } else {
                      // Mostrar mensaje de error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Credenciales inválidas')),
                      );
                    }
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CrearCuenta(onUsuarioCreado: agregarUsuario)),
                    );
                  },
                  child: const Text('Crear cuenta'),
                ),
              ],
            ),
          ],
        ),),
      ),
    );
  }

  bool validarCredenciales(String email, String contra) {
    return usuarios.any((usuario) => usuario.correo == email && usuario.contrasena == contra);
  }

  void agregarUsuario(Usuario nuevoUsuario) {
    setState(() {
      usuarios.add(nuevoUsuario);
    });
  }
}