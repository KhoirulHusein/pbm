class Jubah {
  late String nama;
  late int kekuatan;
  late int kesehatan;

  Jubah(String nama, int kekuatan, int kesehatan) {
    // Inisialisasi atribut atributnya
    this.nama = nama;
    this.kekuatan = kekuatan;
    this.kesehatan = kesehatan;
  }

  String getNama() {
    return this.nama;
  }

  int getTambahKesehatan() {
    return this.kesehatan * 10;
  }

  int getNilaiKekuatan() {
    return this.kekuatan * 2;
  }
}
