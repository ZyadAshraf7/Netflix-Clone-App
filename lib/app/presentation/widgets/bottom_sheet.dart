import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/icon_box.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';

Future customBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    context: context,
    builder: (_) => Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.asset(
                  "assets/images/poster.jpg",
                  height: 120,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 115,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Dark Desires",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            constraints: BoxConstraints(maxHeight: 26),
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Text(
                          "2022",
                          style: TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "13+",
                          style: TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "2 Seasons",
                          style: TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomButton(
                borderRadius: 3,
                width: 180,
                height: 30,
                color: Colors.white,
                function: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/play.svg",
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Play",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              iconBox(title: "Download", iconPath: "assets/images/icons/download.svg", onTap: () {}),
              const SizedBox(width: 42),
              iconBox(title: "Download", iconPath: "assets/images/icons/download.svg", onTap: () {})
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.white70,
            height: 2,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/info.svg",
                      color: Colors.white,
                      width: 20,
                      height: 22,
                    ),
                    const SizedBox(width: 8),
                    const Text("Details & More",style: TextStyle(color: Colors.white),)
                  ],
                ),
                const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
