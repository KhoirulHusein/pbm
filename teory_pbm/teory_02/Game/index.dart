import 'jagoan.dart';
import 'jubah.dart';
import 'senjata.dart';

void main() {
  // Membuat pemaninnya namanya "Pitung"
  Jagoan pitung = Jagoan("Pitung");

  // Membuat Jubah namanya "Jubah Silat Putih", kekuatannya 7, dan kesehatannya 50
  Jubah jubahSilatPutih = Jubah("Jubah Silat Putih", 7, 50);

  // Membuat Senjata namanya "Golok" sama kekuatannya 20
  Senjata golok = Senjata("Golok", 20);

  // Bikinnih kalo Jubah sama Senjata buat si "Pitung"
  pitung.setJubah(jubahSilatPutih);
  pitung.setSenjata(golok);

  // Bikin hal yang sama kayak diatas buat pemainnya namanya "Jaka Sembung"
  Jagoan jakaSembung = Jagoan("Jaka Sembung");
  Jubah jubahSilatHitam = Jubah("Jubah Silat Hitam", 10, 50);
  Senjata toya = Senjata("Toya", 25);

  jakaSembung.setJubah(jubahSilatHitam);
  jakaSembung.setSenjata(toya);

  // Menampilkan informasi dari kedua Jagoan
  pitung.info();
  jakaSembung.info();

  // Buat dia saling serang nih
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);

  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);

  // Menampilkan hasil pertempuran
  print('${pitung.getNama()}: ${pitung.getNilaiKesehatan()}');
  print('${jakaSembung.getNama()}: ${jakaSembung.getNilaiKesehatan()}');

  if (pitung.getStatus() && !jakaSembung.getStatus()) {
    print('${pitung.getNama()} menang cuy!');
  } else if (!pitung.getStatus() && jakaSembung.getStatus()) {
    print('${jakaSembung.getNama()} menang cuy!');
  } else {
    if (pitung.getNilaiKesehatan() > jakaSembung.getNilaiKesehatan()) {
      print('${pitung.getNama()} menang cuy!');
    } else if (pitung.getNilaiKesehatan() < jakaSembung.getNilaiKesehatan()) {
      print('${jakaSembung.getNama()} menang cuy!');
    } else {
      print('Kedua jagoan seri, cuy!');
    }
  }
}
