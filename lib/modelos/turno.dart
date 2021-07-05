class Turno {
  String nombre;
  String numeroTurno;

  Turno({
    this.nombre,
    this.numeroTurno,
  });

  factory Turno.fromJson(Map<String, dynamic> json) {
    return Turno(
      nombre: json['nombre'],
      numeroTurno: json['numeroTurno'],
    );
  }
}
