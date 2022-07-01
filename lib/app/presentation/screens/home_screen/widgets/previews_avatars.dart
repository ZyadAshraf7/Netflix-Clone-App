import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class PreviewsAvatars extends StatelessWidget {
  const PreviewsAvatars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        separatorBuilder: (context, i) {
          return const SizedBox(width: 2);
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                  //height: 190,
                  alignment: Alignment.centerRight,
                  width: 150,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset(
                        "assets/images/poster.jpg",
                      ),
                    ),
                    //height: 190,
                    width: 130,
                  )),
              Positioned(
                top: 50,
                right: i == 9 ? 45 : 65,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/images/${i + 1}.png"),
                  height: 190,
                  width: 120,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    i != 0
                        ?  BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            offset: Offset(4, 123),
                            spreadRadius: 15,
                            blurRadius: 10,
                          )
                        : const BoxShadow(),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
/*Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: AppTheme.greyColor,
              image: const DecorationImage(
                image: AssetImage("assets/images/movie.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: i.isEven ? Colors.red : Colors.amber,
                width: 1.0,
              ),
            ),
          );*/
