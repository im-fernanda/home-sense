import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/user.dart';
import '../widgets/room_card.dart';
import '../widgets/routine_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);

  String username = User.username;

  List roomList = [
    "Sala de Estar",
    "Quarto",
    "Cozinha",
    "Banheiro",
    "Garagem",
    "Área Externa"
  ];

  List imageList = [
    "sala_img.jpg",
    "quarto_img.jpg",
    "cozinha_img.jpg",
    "banheiro_img.jpg",
    "garagem_img.jpg",
    "externo_img.jpg"
  ];

  List routineList = ["Chegada", "Saida"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hello, ${username}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                "Meus cômodos",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: roomList.length,
                    itemBuilder: (context, index) {
                      return RoomCard(
                          roomImage: imageList[index],
                          roomTitle: roomList[index]);
                    }),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
                child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                  dotColor: Colors.grey.withOpacity(0.3),
                  activeDotColor: Colors.amber,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5),
            )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                "Minhas rotinas",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.8, // Controla a proporção entre largura e altura
                  ),
                  itemBuilder: (context, index) {
                    return RoutineCard(routineTitle: routineList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
