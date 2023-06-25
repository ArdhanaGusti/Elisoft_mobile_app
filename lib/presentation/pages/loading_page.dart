import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 30,
                  maxLength: width / 2,
                  randomLength: true,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: 20),
                height: 200,
                // color: Colors.red,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 0.583 * width,
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 20,
                              maxLength: width / 3,
                              randomLength: true,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD8E3E7),
                          Color(0xFFC8D5DA),
                          Color(0xFFD8E3E7),
                        ],
                        stops: [
                          0.1,
                          0.5,
                          0.9,
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SkeletonItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: double.infinity,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                width: double.infinity,
                                height: 80,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 20,
                                  maxLength: width / 2,
                                  randomLength: true,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
