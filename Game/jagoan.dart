import 'jubah.dart';
import 'senjata.dart';

class Jagoan {
  late String nama;
  late int kesehatanDasar;
  late int kekuatanDasar;
  late int derajat;
  late int totalKerusakan = 0;
  late int kenaikanKesehatan;
  late int kenaikanKekuatan;
  late bool hidup;
  late Jubah jubah;
  late Senjata senjata;

  Jagoan(String nama) {
    // Inisialisasi atribut-atribut
    this.nama = nama;
    this.kesehatanDasar = 100;
    this.kekuatanDasar = 100;
    this.derajat = 1;
    this.kenaikanKekuatan = 10;
    this.kenaikanKesehatan = 10;
    this.hidup = true;
    this.jubah = Jubah("", 0, 0); 
    this.senjata = Senjata("", 0);
  }


  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return this.nama;
  }

  // Buat perhitungan buat nilai kesehataaan maksimalnya
  int sehatMaksimal() {
    return this.kesehatanDasar +
      this.jubah.getTambahKesehatan() + // Dapetin tambahan kesehatan dari jubah pake rumus di file jubah dikali 10
      this.derajat * this.kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return this.kekuatanDasar +
      this.senjata.getKekuatanSerang() + // Dapetin tambahan serangan dari senjata pake rumus di file senjata dikali 2
      this.derajat * this.kenaikanKekuatan;
  }

  // Buat nilai kesehatan saat ini
  int getNilaiKesehatan() {
    return this.sehatMaksimal() - this.totalKerusakan;
  }

  void naikDerajat() {
    this.derajat++;
  }

  bool getStatus() {
    return this.hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = this.getKekuatanSerangJagoan();

    print('${this.nama} menyerang ${lawan.getNama()} dengan kekuatan $kerusakan');

    lawan.bertahan(kerusakan);

    this.naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = this.jubah.getNilaiKekuatan();
    int selisihKerusakan;

    print('${this.nama} memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    this.totalKerusakan += selisihKerusakan;

    if (this.getNilaiKesehatan() <= 0) {
      this.hidup = false;
      this.totalKerusakan = this.sehatMaksimal();
    }

    this.info();
  }

  void info() {
    print('Jagoan\t\t\t: ${this.nama}');
    print('Derajat\t\t\t: ${this.derajat}');
    print('Kesehatan Dasar\t\t: ${this.kesehatanDasar}');
    print('Kekuatan Dasar\t\t: ${this.kekuatanDasar}');
    print('Kesehatan\t\t: ${this.getNilaiKesehatan()}/${this.sehatMaksimal()}');
    print('Kekuatan Maksimal\t: ${this.getKekuatanSerangJagoan()}');
    print('Masih hidup?\t\t: ${this.hidup}\n');
  }
}
