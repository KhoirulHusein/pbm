import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() {
    return _RatingScreenState();
  }
}

class _RatingScreenState extends State<RatingScreen> {
  final TextEditingController _reviewController = TextEditingController();

  double _currentRating = 0.0;
  final List<double> _ratings = [];
  final List<String> _reviews = [];

  void _submitRating() {
    setState(() {
      _ratings.add(_currentRating);
      _reviews.add(_reviewController.text);
      _currentRating = 0.0;
      _reviewController.clear();
    });
  }

  double _calculateAverageRating() {
    if (_ratings.isEmpty) {
      return 0.0;
    } else {
      double totalRating = _ratings.reduce((value, element) => value + element);
      return totalRating / _ratings.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Ratings & Reviews',
          style: TextStyle(
            color: Color.fromARGB(255, 111, 111, 111),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RatingBar.builder( // Use RatingBar.builder instead of RatingBar.build
              initialRating: _calculateAverageRating(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _currentRating = rating;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Anda Memiliki jumlah ${_ratings.length} penilaian dan \nrata-rata ${_calculateAverageRating().toStringAsFixed(1)} penilaian',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 163, 163, 163),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${_ratings.length}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Total Rating",
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _calculateAverageRating().toStringAsFixed(1),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Rata-Rata",
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 5,
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'Tulis Pengalaman Anda',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Berikan Penilaian anda',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 163, 163, 163),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: RatingBar.builder(
                                  initialRating: _currentRating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      _currentRating = rating;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                'Tinggalkan Masukan anda: ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 163, 163, 163),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextField(
                                controller: _reviewController,
                                decoration: const InputDecoration(
                                  hintText: 'Masukan ulasan anda',
                                  border: OutlineInputBorder(),
                                  hintMaxLines: 10,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    // borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _submitRating();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 163, 163, 163),
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tulis Ulasan Anda Disini!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.comment,
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Review Terbaru",
              style: TextStyle(
                color: Color.fromARGB(255, 163, 163, 163),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rating: ${_ratings[index]}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Ulasan: ${_reviews[index]}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: const Color.fromARGB(255, 163, 163, 163),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
