import 'package:day23/mydb/db.dart';
import 'package:day23/widgets/hospital_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? pageController;
  double pageNumber = 0.0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    pageController!.addListener(() {
      setState(() {
        pageNumber = pageController!.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          PageView.builder(
            itemBuilder: (context, index) =>
                HospitalItem(hospitals[index], pageNumber, index.toDouble()),
            itemCount: hospitals.length,
            controller: pageController,
          ),
        ]),
      ),
    );
  }
}
