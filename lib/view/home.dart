import 'package:flutter/material.dart';
import '../view_model/background.dart';
import '../view_model/custom_appbar.dart';
import '../view_model/single_category.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          flexibleSpace: const CustomAppBar(),
        ),
        backgroundColor: const Color(0xff566af4),
        body: Stack(children: [
          const SizedBox(
            height: 20,
          ),
          const Background(),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleCategory(
                          name: 'Sport', category: 21, img: 'sporticon'),
                      SingleCategory(
                          name: 'Computer Science',
                          category: 18,
                          img: 'computer'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleCategory(
                        category: 31,
                        name: 'Anime',
                        img: 'anime',
                      ),
                      SingleCategory(
                        category: 15,
                        name: 'Video Games',
                        img: 'game',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleCategory(
                        category: 23,
                        name: 'History',
                        img: 'history',
                      ),
                      SingleCategory(
                        category: 22,
                        name: 'Geography',
                        img: 'geography',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleCategory(
                        category: 20,
                        name: 'Mythology',
                        img: 'mythology',
                      ),
                      SingleCategory(
                        category: 19,
                        name: 'Math Science',
                        img: 'mathScience',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleCategory(
                        category: 9,
                        name: 'General Knowledge',
                        img: 'generalKnowledge',
                      ),
                      SingleCategory(
                        category: 12,
                        name: 'Music',
                        img: 'music',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
