import 'dart:async';

import 'package:flutter/material.dart';

class BannerWidge extends StatefulWidget {
  BannerWidge(
      {Key key = const Key("banner"),
      required this.childWidget,
      this.enableIndicator = true,
      this.initPage = 2,
      this.height = 350,
      this.width = 340,
      this.indicatorRadius = 4,
      this.indicatorColor = Colors.black,
      this.indicatorSelectedColor = Colors.red,
      this.scrollDirection = Axis.horizontal,
      this.indicatorSpaceBetween = 6,
      this.autoDisplayInterval = 0,
      required this.onPageSelected,
      this.indicatorAlign = Alignment.bottomCenter,
      required this.onPageClicked})
      : super(key: key);

  final double width;
  final double height;

  ///子 Widget 集合
  final List<Widget> childWidget;

  final bool enableIndicator;
  final Axis scrollDirection;

  final ValueChanged<int> onPageSelected;
  final ValueChanged<int> onPageClicked;

  final int initPage;

  final Color indicatorSelectedColor;
  final Color indicatorColor;
  final double indicatorRadius;

  final double indicatorSpaceBetween;

  final int autoDisplayInterval;

  final Alignment indicatorAlign;

  @override
  __BannerWidgetState createState() => __BannerWidgetState();
}

class __BannerWidgetState extends State<BannerWidge> {
  int selectedPage = 0;
  late PageController _controller;
  late Timer _timer;
  int lastTapDownTime = 0;

  @override
  Widget build(BuildContext context) {
    _controller = PageController(initialPage: widget.initPage);

    Widget pageView = GestureDetector(
      onHorizontalDragDown: _onHorizontalDragDown,
      onTap: _onPageClicked,
      child: PageView(
        scrollDirection: widget.scrollDirection,
        onPageChanged: onPageChanged,
        controller: _controller,
        children: widget.childWidget,
      ),
    );

    Widget indicatorWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.childWidget.map((f) {
        int index = widget.childWidget.indexOf(f);
        Widget indicatorWidget = Container(
          width: Size.fromRadius(widget.indicatorRadius).width,
          height: Size.fromRadius(widget.indicatorRadius).height,
          margin: EdgeInsets.only(right: widget.indicatorSpaceBetween),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedPage
                  ? widget.indicatorSelectedColor
                  : widget.indicatorColor),
        );
        return indicatorWidget;
      }).toList(),
    );

    Widget stackWidget = widget.enableIndicator
        ? Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              pageView,
              Positioned(
                  bottom: 6,
                  child: Align(
                    alignment: widget.indicatorAlign,
                    child: indicatorWidget,
                  ))
            ],
          )
        : pageView;

    Widget parent = Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: stackWidget,
        ));

    return parent;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _onHorizontalDragDown(DragDownDetails details) {
    if (_timer == null) {
      return;
    }
    _releaseTimer();
    Future.delayed(const Duration(seconds: 2));
    _startTimer();
  }

  void _startTimer() {
    if (widget.autoDisplayInterval <= 0) {
      return;
    }
    var oneSec = Duration(seconds: widget.autoDisplayInterval);
    _timer = Timer.periodic(oneSec, (timer) {
      ++selectedPage;
      selectedPage = selectedPage % widget.childWidget.length;
      _controller.jumpToPage(selectedPage);
      onPageChanged(selectedPage);
    });
  }

  void _releaseTimer() {
    if (_timer != null && !_timer.isActive) {
      return;
    }
    _timer.cancel();
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
    widget.onPageSelected(index);
  }

  void _onPageClicked() {
    widget.onPageClicked(selectedPage);
  }
}
