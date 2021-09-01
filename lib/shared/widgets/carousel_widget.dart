import 'package:doctores/themes/app_colors.dart';
import 'package:doctores/themes/app_images.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PageViewer extends StatefulWidget {
  const PageViewer({Key? key}) : super(key: key);

  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.01);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: _updatePosition,
          controller: _pageController,
          children: [
            CardWidget(
              text: "Espaço para banners publicitários",
              color: AppColors.primary,
              slogan: "Bem-vindo ao 3D",
              description: "Seu app de animações",
              buttonVisible: true,
            ),
            CardWidget(
              text: "Seja bem vindo ao melhor app",
              color: AppColors.heading,
              slogan: "Espaço dollor",
              description: "Lorem Lorem Lorems",
              buttonVisible: false,
            ),
            CardWidget(
              text: "Espaço para banners publicitários",
              color: AppColors.secondary,
              slogan: "Bem-vindo ao 3D",
              description: "Seu app de animações",
              buttonVisible: false,
            ),
            CardWidget(
              text: "Espaço para banners publicitários",
              color: Colors.black87,
              slogan: "Bem-vindo ao 3D",
              description: "Seu app de animações",
              buttonVisible: false,
            ),
            CardWidget(
              text: "Espaço para banners publicitários",
              color: AppColors.primary,
              slogan: "Bem-vindo ao 3D",
              description: "Seu app de animações",
              buttonVisible: true,
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: DotsIndicator(
              dotsCount: _totalDots,
              position: _currentPosition,
              decorator: DotsDecorator(
                activeColor: AppColors.white,
                color: Colors.grey,
              )),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    @required this.text,
    @required this.color,
    this.slogan,
    this.buttonVisible = false,
    this.description,
    this.currentPage,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final String? slogan;
  final String? description;
  final bool buttonVisible;
  final double? currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(50))),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 245,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text.toString(),
                    style: TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    slogan.toString(),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    description.toString(),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (buttonVisible)
                    ElevatedButton(
                      onPressed: () {
                        // print(currentPage);
                      },
                      child: Text(
                        'Saber mais...',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      width: 3, color: AppColors.white)))
                          .copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.white),
                              elevation: MaterialStateProperty.all(0)),
                    ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.avatar_3,
                      height: 180,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
