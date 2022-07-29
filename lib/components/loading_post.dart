import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import '../styles/colors.dart';

class LoadingPost extends StatelessWidget {
  const LoadingPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.height20),
      padding: EdgeInsets.all(context.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height10),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: context.height10 * 1.2,
            spreadRadius: context.height10 * 0.5,
            offset: Offset(context.height10, context.height10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: context.height20 * 1.2,
                  child: Icon(
                    Icons.person,
                    color: avatar,
                    size: context.height30,
                  )),
              const Spacer(),
              Column(
                children: [
                  Icon(Icons.share, size: context.height30),
                  SizedBox(
                    height: context.height15,
                  ),
                ],
              ),
              SizedBox(
                width: context.height10,
              ),
              Column(
                children: [
                  Icon(Icons.bookmark, size: context.height30),
                  SizedBox(
                    height: context.height15,
                  ),
                ],
              ),
              SizedBox(
                width: context.height10,
              ),
              Column(
                children: [
                  SizedBox(
                      height: context.height30 * 1.3,
                      child: Icon(Icons.thumb_up, size: context.height30)),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.height10 / 2,
                          vertical: context.height10 / 2),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(context.height10 / 2),
                      ),
                      child: const Center(child: Text('')))
                ],
              )
            ],
          ),
          SizedBox(
            height: context.height10,
          ),
          Container(
            height: context.height30 * 7,
            width: context.screenWidth,
            decoration: BoxDecoration(
              color: shadowColor,
              borderRadius: BorderRadius.circular(context.height10),
            ),
          ),
          SizedBox(
            height: context.height10,
          ),
          const Text('')
        ],
      ),
    );
  }
}
