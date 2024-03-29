import 'package:flutter/material.dart';
import 'package:flutter_application_1/password.dart';
import 'package:flutter_application_1/registro.dart';
class CrearCuenta extends StatefulWidget {
  final void Function(Usuario) onUsuarioCreado;

  CrearCuenta({required this.onUsuarioCreado});

  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contraController = TextEditingController();
  final TextEditingController confirmaContraController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, 
             autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: nombreController,
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: correoController,
                  maxLength: 30,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
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
                TextFormField(
                  controller: telefonoController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                contraField(
                  controller: contraController,
                  labelText: 'Contraseña',
                ),
                const SizedBox(height: 16),
                contraField(
                  controller: confirmaContraController,
                  labelText: 'Confirmar Contraseña',
                ),
                ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (confirmaContraController.text != contraController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No coinciden las contraseñas")));
                  } else {
                        Usuario nuevoUsuario = Usuario(
                        nombre: nombreController.text,
                        correo: correoController.text,
                        telefono: int.tryParse(telefonoController.text) ?? 0,
                        contrasena: contraController.text,
                    );
                  widget.onUsuarioCreado(nuevoUsuario);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Usuario creado con éxito')),
                );
                Navigator.of(context).pop(); // Esta línea agrega la funcionalidad para volver a la página anterior
                }
                }   
                },
              child: const Text('Crear cuenta'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}