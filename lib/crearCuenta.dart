import 'package:flutter/material.dart';
import 'package:flutter_application_1/registro.dart';

class CrearCuenta extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contraController = TextEditingController();
  final TextEditingController confirmaContraController =
      TextEditingController();
  final void Function(Usuario) onUsuarioCreado;

  CrearCuenta({required this.onUsuarioCreado});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Crear Cuenta'),
        ),
        resizeToAvoidBottomInset: false, // Evita que el Scaffold se redimensione para evitar el teclado
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [ 
              TextField(
                controller: nombreController,
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: correoController,
                maxLength: 30,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: telefonoController,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: contraController,
                maxLength: 30,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmaContraController,
                maxLength: 30,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nombreController.text.isEmpty ||
                      correoController.text.isEmpty ||
                      telefonoController.text.isEmpty ||
                      contraController.text.isEmpty ||
                      confirmaContraController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Falta rellenar campos")),
                    );
                  } else if (confirmaContraController.text !=
                      contraController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Las contraseñas no coinciden")),
                    );
                  } else {
                    Usuario nuevoUsuario = Usuario(
                      nombre: nombreController.text,
                      correo: correoController.text,
                      telefono: int.tryParse(telefonoController.text) ?? 0,
                      contrasena: contraController.text,
                    );
                    onUsuarioCreado(nuevoUsuario);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Usuario creado con éxito')),
                    );
                  }
                },
                child: const Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}