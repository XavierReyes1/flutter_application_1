
import 'package:flutter/material.dart';
import 'package:flutter_application_1/registro.dart';

class CrearCuenta extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contraController = TextEditingController();

  final void Function(Usuario) onUsuarioCreado;

  CrearCuenta({required this.onUsuarioCreado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
      ),
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
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Usuario nuevoUsuario = Usuario(
                  nombre: nombreController.text,
                  correo: correoController.text,
                  telefono: int.tryParse(telefonoController.text) ?? 0,
                  contrasena: contraController.text,
                );
                onUsuarioCreado(nuevoUsuario);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuario creado con éxito')),
                );
              },
              child: const Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}