// lib/model/endemik.dart

class Endemik {
  final String id; // Tidak nullable karena kolom PRIMARY KEY tidak boleh null
  final String nama;
  final String nama_latin;
  final String deskripsi;
  final String asal;
  final String foto;
  final String status;
  String is_favorit; // "true" atau "false"

  Endemik({
    required this.id,
    required this.nama,
    required this.nama_latin,
    required this.deskripsi,
    required this.asal,
    required this.foto,
    required this.status,
    this.is_favorit = "false",
  });

  /// Buat dari JSON (saat fetch dari API)
  factory Endemik.fromJson(Map<String, dynamic> json) => Endemik(
    id: json["id"] ?? "",
    nama: json["nama"] ?? "",
    nama_latin: json["nama_latin"] ?? "",
    deskripsi: json["deskripsi"] ?? "",
    asal: json["asal"] ?? "",
    foto: json["foto"] ?? "",
    status: json["status"] ?? "",
    is_favorit: json["is_favorit"] ?? "false",
  );

  /// Buat dari Map (saat fetch dari SQLite)
  factory Endemik.fromMap(Map<String, dynamic> map) => Endemik(
    id: map['id'] ?? "",
    nama: map['nama'] ?? "",
    nama_latin: map['nama_latin'] ?? "",
    deskripsi: map['deskripsi'] ?? "",
    asal: map['asal'] ?? "",
    foto: map['foto'] ?? "",
    status: map['status'] ?? "",
    is_favorit: map['is_favorit'] ?? "false",
  );

  /// Untuk simpan ke database (insert/update)
  Map<String, dynamic> toMap() => {
    'id': id,
    'nama': nama,
    'nama_latin': nama_latin,
    'deskripsi': deskripsi,
    'asal': asal,
    'foto': foto,
    'status': status,
    'is_favorit': is_favorit,
  };

  /// Agar bisa digunakan di Provider & List.contains()
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Endemik &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
