import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/const/color_const.dart';

class CustomImageSlider extends StatefulWidget {
  final List<Widget> images;
  final double height;

  const CustomImageSlider({super.key, required this.images, required this.height});

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                double sensitivity = 1.0; // Adjust sensitivity as needed
                _controller.jumpTo(_controller.offset - details.primaryDelta! / sensitivity);
              },
              child: Container(
                height: widget.height,
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: PageView(
                  controller: _controller,
                  children: widget.images,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                  iconSize: 24,
                  color: ColorTheme.kOGBlueColor,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: widget.images.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: ColorTheme.kOGBlueColor,
                    dotColor: ColorTheme.kGrey,
                  ),
                ).marginSymmetric(horizontal: 24),
                IconButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
                  iconSize: 24,
                  color: ColorTheme.kOGBlueColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
