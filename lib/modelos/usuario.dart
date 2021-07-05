class Usuario{
   String idUsuario;
   String identificacion;
   String nombreUsuario;
   String telefono;
   String correo;
   String pass;
   String rutaFoto;
   String idRol;
  
  Usuario( {
    this.idUsuario, 
    this.identificacion, 
    this.nombreUsuario, 
    this.telefono, 
    this.correo, 
    this.pass, 
    this.rutaFoto,
    this.idRol,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['idUsuario'],
      identificacion: json['identificacion'],
      nombreUsuario: json['nombreUsuario'],
      telefono: json['telefono'],
      correo: json['correo'],
      pass: json['pass'],
      rutaFoto: json['rutaFoto'],
      idRol: json['idRol']
    );
  }
}