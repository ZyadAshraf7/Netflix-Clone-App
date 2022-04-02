import 'package:flutter/material.dart';
class MovieInfoBox extends StatelessWidget {
  const MovieInfoBox({Key? key,required this.releaseYear,required this.age,required this.movieDuration}) : super(key: key);
  final String releaseYear;
  final String age;
  final String movieDuration;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "94% Match",
              style: TextStyle(
                  color: Color(
                    0xff27AE60,
                  ),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
             Text(
              releaseYear,
              style: const TextStyle(color: Colors.white38, fontSize: 14),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey.withOpacity(0.3),
              ),
              padding: const EdgeInsets.all(3),
              child: Text(
                age,
                style: const TextStyle(color: Colors.white38, fontWeight: FontWeight.bold),
              ),
            ),
             Text(movieDuration, style: const TextStyle(color: Colors.white38, fontSize: 14))
          ],
        ),
      ),
    );
  }
}
