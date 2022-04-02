import 'package:flutter/material.dart';

class MovieTextDetails extends StatelessWidget {
  const MovieTextDetails({Key? key, required this.description,required this.director, required this.starring}) : super(key: key);
  final String description;
  final String director;
  final List<String> starring;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.83),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Starring: ",
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Text(
                  starring.join(" , "),
                  style: const TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Director: ",
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
               director,
                style: const TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          /*RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "Starring: ",style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 14,)
                ),
                TextSpan(
                    text: "adipiscing elit. Sit quam dui,\n",style: TextStyle(color: Colors.white38,fontSize: 14,)
                ),
                TextSpan(
                    text: "Director: ",style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 14,)
                ),
                TextSpan(
                    text: "adipiscing elit",style: TextStyle(color: Colors.white38,fontSize: 14,)
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }
}
