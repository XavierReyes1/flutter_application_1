



class Usuario {
  final String nombre;
  final String correo;
  final int telefono;
  final String contrasena;

  Usuario({
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.contrasena,
  });
  
}

void main() {
  // Crear una instancia de Usuario con los datos proporcionados
  Usuario(
    nombre: 'Axel',
    correo: 'axreyes@unah.hn',
    telefono: 99999,
    contrasena: '20202001747',
  );

 Usuario(
    nombre: 'Reyes',
    correo: 'una@unah.hn',
    telefono: 99999,
    contrasena: '2020',
  );


}
