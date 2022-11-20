import 'dart:async';

import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key key = const Key("BannerWidget"),
    required this.imageList,
    required this.stringList,
    this.height = 350,
    this.width = 0,
    this.imageWidth = 340,
    this.imageHeight = 350,
    this.imageRadius = const BorderRadius.only(
      topLeft: Radius.circular(35),
      bottomRight: Radius.circular(35),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    ),
    this.autoDisplayTime = 500,
    required this.onPageClicked,
    this.indicatorStyle = false,
    this.indicatorShape = BoxShape.rectangle,
    this.indicatorMargin = 4,
    this.indicatorHeight = 2,
    this.indicatorWidth = 15,
    this.indicatorDefaultColor = Colors.black26,
    this.indicatorSelectedColor = Colors.black,
  }) : super(key: key);

  final double imageWidth;
  final double imageHeight;

  final double width;
  final double height;

  ///图片播放时间
  final int autoDisplayTime;

  ///图片圆角
  final BorderRadius imageRadius;

  ///图片集合
  final List<String> imageList;
  final List<String> stringList;

  final ValueChanged<int> onPageClicked;

  ///指示器样式, true 为数字, false 为圆点
  final bool indicatorStyle;

  ///以下属性只有在 indicatorStyle 为 false 时才会生效
  final BoxShape indicatorShape;
  final double indicatorMargin;
  final double indicatorHeight;
  final double indicatorWidth;
  final Color indicatorDefaultColor;
  final Color indicatorSelectedColor;

  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<BannerWidget> {
  //轮播图 PageView 使用的控制器
  late PageController _pageController;

  //定时器自动轮播
  late Timer _timer;

  int currentIndex = 1000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBanner(),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 5000), (value) {
      currentIndex++;

      ///页面跳转
      _pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: widget.autoDisplayTime),
          curve: Curves.easeIn);

      ///刷新
      setState(() {});
    });
  }

  buildBanner() {
    return SizedBox(
      height: widget.height,
      width: widget.width == 0 ? double.infinity : widget.width,
      child: Stack(
        children: [
          buildBannerWidget(),
          // bannerTitleWidget(),
          buildTipsWidget()
        ],
      ),
    );
  }

  buildBannerWidget() {
    return GestureDetector(
        onTap: _onPageClicked,
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildPageViewItemWidget(index);
          },
          controller: _pageController,
          itemCount: widget.imageList.length * 10000,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }

  // bannerTitleWidget() {
  //   return Align(
  //     alignment: const Alignment(-0.85, 0.8),
  //     child: Text(),
  //   );
  // }

  buildTipsWidget() {
    return widget.indicatorStyle
        ? Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              //内边距
              margin: const EdgeInsets.only(right: 24),
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                  "${currentIndex % widget.imageList.length + 1}/${widget.imageList.length}"),
            ),
          )
        : Align(
            alignment: const Alignment(0.0, 0.93),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicatorList()));
  }

  ///通过Container来显示图片
  buildPageViewItemWidget(int index) {
    return Container(
        height: widget.imageHeight,
        width: widget.imageWidth,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: widget.imageRadius,
          image: DecorationImage(
              image: NetworkImage(
                  widget.imageList[index % widget.imageList.length]),
              fit: BoxFit.fill,
              repeat: ImageRepeat.noRepeat),
        ),
        child: Align(
          alignment: const Alignment(-0.85, 0.8),
          child: Text(
            widget.stringList[index % widget.imageList.length],
            maxLines: 2,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }

  indicatorList() {
    List<Widget> indicator = [];
    for (int i = 0; i < widget.imageList.length; i++) {
      Widget indicatorWidget = Container(
        width: Size.fromRadius(widget.indicatorWidth).width,
        height: Size.fromRadius(widget.indicatorHeight).height,
        margin: EdgeInsets.only(right: widget.indicatorMargin),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: currentIndex % widget.imageList.length + 1 == i + 1
                ? widget.indicatorSelectedColor
                : widget.indicatorDefaultColor),
      );
      indicator.add(indicatorWidget);
    }
    return indicator;
  }

  ///页面点击回调
  _onPageClicked() {
    widget.onPageClicked(currentIndex % widget.imageList.length + 1);
  }
}
