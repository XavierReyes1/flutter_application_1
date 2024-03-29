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
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Center(
                child: FlutterLogo(size: 100),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                maxLength: 30,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un correo electrónico.';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Por favor, ingresa un correo electrónico válido.';
                  }
                  return null;
                },
              ),
             
              const SizedBox(height: 16),
               contraField(controller: contraController,labelText: "contaseña",),
              const SizedBox(height: 16),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Validar correo y contraseña
                        String email = emailController.text;
                        String contra = contraController.text;
                        bool credencialesValidas = validarCredenciales(email, contra);

                        if (credencialesValidas) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => inicio(emailController.text)),
                          );
                        } else {
                          // Mostrar mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Credenciales inválidas')),
                          );
                        }
                      }
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                  const SizedBox(width: 16),
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
          ),
        ),
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