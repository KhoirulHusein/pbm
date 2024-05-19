import 'story.dart';

class StoryBrain {
  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Seorang gadis muda bernama Cinderella tinggal bersama ibu tirinya yang kejam dan kedua saudari tirinya yang sombong. Mereka memperlakukan Cinderella seperti pelayan di rumah mereka sendiri. Suatu hari, sebuah undangan datang dari istana untuk sebuah pesta dansa yang akan diadakan oleh Putra Mahkota. Cinderella ingin pergi ke pesta tersebut, tetapi ibu tirinya melarangnya dan menyuruhnya membersihkan rumah.',
        choice1: 'Cinderella tetap memohon untuk pergi ke pesta.',
        choice2: 'Cinderella menuruti perintah ibu tirinya.'),
    Story(
        storyTitle:
            'Meskipun dihina dan dilarang, Cinderella tetap berharap untuk pergi ke pesta dansa. Tiba-tiba, seorang peri muncul di hadapannya dan memberinya gaun cantik serta sepatu kaca. Peri itu memberitahunya bahwa siapa pun yang mengenakan sepatu kaca tersebut akan terlihat luar biasa. Cinderella sangat bahagia dan segera pergi ke pesta itu.',
        choice1: 'Cinderella tiba di istana dan bertemu dengan Putra Mahkota.',
        choice2: 'Cinderella ragu-ragu dan tidak masuk ke dalam istana.'),
    Story(
        storyTitle:
            'Di dalam istana, Cinderella menari dengan Putra Mahkota sepanjang malam. Mereka saling jatuh cinta pada pandangan pertama. Cinderella merasa bahagia sekali, tetapi tiba-tiba lonceng jam menunjukkan pukul dua belas malam. Dia ingat apa yang pernah dikatakan peri tadi, bahwa pesona gaunnya akan hilang pada tengah malam.',
        choice1: 'Cinderella berlari keluar dari istana agar tidak ketahuan.',
        choice2: 'Cinderella memilih bertahan di dalam istana meskipun bahaya menanti.'),
    Story(
        storyTitle:
            'Cinderella berlari keluar dari istana dengan tergesa-gesa. Saat dia lari turun tangga, salah satu sepatu kakinya terjatuh. Cinderella tidak berani mengambilnya kembali dan melanjutkan lari pulang. Di rumah, semua kembali seperti semula. Dia kembali menjadi pelayan bagi ibu tirinya dan saudara-saudari tirinya.',
        choice1: 'Cinderella merasa sedih namun bersemangat untuk bertemu lagi dengan Putra Mahkota.',
        choice2: 'Cinderella merasa putus asa dan menyesal tidak mengambil sepatu kaca yang jatuh.'),
    Story(
        storyTitle:
            'Beberapa hari kemudian, Putra Mahkota datang ke rumah Cinderella dengan membawa sepatu kaca yang hilang. Dia ingin mencari gadis yang cocok dengan sepatu itu. Saudara-saudari tirinya mencoba memakai sepatu itu, tetapi tidak cocok. Akhirnya, giliran Cinderella mencoba sepatu itu dan cocok sempurna. Putra Mahkota mengetahui siapa Cinderella sebenarnya.',
        choice1: 'Putra Mahkota memilih Cinderella sebagai pasangannya dan mereka hidup bahagia selamanya.',
        choice2: 'Putra Mahkota meminta maaf karena tidak bisa mengubah nasib Cinderella.'),
    Story(
        storyTitle:
            'Cinderella dan Putra Mahkota menikah dan hidup bahagia selamanya. Mereka tidak pernah melupakan betapa berarti pertemuan mereka yang tak terduga di pesta dansa. Cinderella juga memaafkan ibu tirinya yang dulu pernah menyakitinya. Mereka hidup dengan damai dan kebahagiaan.',
        choice1: 'Selesai',
        choice2: ''),
    Story(
        storyTitle: 'Cerita Cinderella berakhir di sini. Apakah Anda ingin memulai kembali?',
        choice1: 'Mulai Ulang',
        choice2: ''),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  int _storyNumber = 0;

  void restart() {
    _storyNumber = 0;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 3 || _storyNumber == 4) {
      _storyNumber = 6;
    } else if (_storyNumber == 5 || _storyNumber == 6) {
      restart();
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber >= 0 && _storyNumber <= 4) {
      return true;
    } else {
      return false;
    }
  }
}
