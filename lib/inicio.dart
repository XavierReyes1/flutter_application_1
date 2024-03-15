import 'package:flutter/material.dart';


class inicio extends StatelessWidget {
  final String correoUsuario;

  const inicio(this.correoUsuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Text('¡Bienvenido, $correoUsuario!'),
      ),
    );
  }
}
