import 'package:doctores/shared/widgets/carousel_widget.dart';
import 'package:doctores/themes/app_colors.dart';
import 'package:doctores/themes/app_images.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top container
            Container(
              height: 80,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(AppImages.gif_earth),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
//cardWiget

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.25),
              ),
              height: 260,
              width: 450,
              child: PageViewer(),
            ),

            SizedBox(
              height: 30,
            ),
            buildTextSearch(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Categorias",
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 120,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategorieCard("Minha Saúde", Ionicons.bandage_outline),
                  buildCategorieCard("Otorrinolaria ", Ionicons.ear_outline),
                  buildCategorieCard("Cardiologista", Ionicons.fitness_outline),
                  buildCategorieCard("Piscologista", Ionicons.sad_outline),
                  buildCategorieCard("Analises Clinica", Ionicons.airplane),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Nossos médicos",
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

Container buildTextSearch() {
  return Container(
    height: 50.0,
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: AppColors.greywhite,
    ),
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: AppColors.greyText,
          ),
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Encontrar médicos, consultorios, especialistas..."),
    ),
  );
}

Container buildCategorieCard(
  String text,
  IconData iconData,
) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 100,
      width: 120,
      child: GestureDetector(
        onTap: () {
          print("Container was tapped");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 38,
              color: AppColors.greyText,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: AppColors.greyText),
            ),
          ],
        ),
      ));
}
