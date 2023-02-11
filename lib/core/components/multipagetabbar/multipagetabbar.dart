import 'package:earhquake_stock_managment/core/common/models/sheetlistmodel/sheetlistmodel.dart';
import 'package:flutter/material.dart';

class MultiPageTabbar<T> extends StatefulWidget {
  final List<Widget> children;
  final int initialIndex;
  final List<SheetListModel<T>> tabs;
  final ValueChanged<int> tabChanged;
  final ValueChanged<TabController>? tabControllerCreated;

  final Color indicatorPassive;
  final Color indicatorActive;
  final Color tabBackground;
  final double minWidth;
  final EdgeInsetsGeometry tabPadding;
  final TextStyle labelStyle;
  final Color labelColor;
  final Color unselectedLabelColor;
  final Widget Function(TabController)? tabWidgetGenerator;

  final Widget? child;
  final ScrollPhysics physics;

  const MultiPageTabbar(
      {Key? key,
      required this.tabs,
      required this.tabChanged,
      required this.children,
      this.tabControllerCreated,
      this.minWidth = 0,
      this.initialIndex = 0,
      this.labelColor = Colors.black,
      this.unselectedLabelColor = Colors.black,
      this.tabWidgetGenerator,
      Color? indicatorPassive,
      Color? indicatorActive,
      Color? tabBackground,
      TextStyle? selectedTabText,
      EdgeInsetsGeometry? tabPadding,
      TextStyle? labelStyle,
      this.child,
      this.physics = const AlwaysScrollableScrollPhysics()})
      : indicatorPassive = indicatorPassive ?? Colors.black12,
        indicatorActive = indicatorActive ?? Colors.blueAccent,
        tabBackground = tabBackground ?? Colors.white,
        tabPadding = tabPadding ?? const EdgeInsets.all(0),
        labelStyle = labelStyle ?? const TextStyle(),
        super(key: key);

  @override
  MultiPageTabbarState createState() => MultiPageTabbarState();
}

class MultiPageTabbarState extends State<MultiPageTabbar>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  late TabController controller;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    controller = TabController(
      length: widget.tabs.length,
      initialIndex: currentIndex >= widget.tabs.length ? 0 : currentIndex,
      vsync: this,
    );
    if (widget.tabControllerCreated != null) {
      widget.tabControllerCreated!(controller);
    }
    wireListener();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MultiPageTabbar oldWidget) {
    setState(() {});

    super.didUpdateWidget(oldWidget);
  }

  void wireListener() {
    controller.addListener(() {
      setState(() {
        currentIndex = controller.index;
      });
      widget.tabChanged(controller.index);
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  Widget getTab(SheetListModel item) {
    return Container(
      key: Key(item.key.toString()),
      padding: widget.tabPadding,
      constraints: BoxConstraints(minWidth: widget.minWidth),
      color: widget.tabBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, .96, .96, 1],
              colors: [
                widget.tabBackground,
                widget.tabBackground,
                widget.indicatorPassive,
                widget.indicatorPassive,
              ],
            ),
          ),
          child: widget.tabWidgetGenerator != null
              ? widget.tabWidgetGenerator!(controller)
              : PxTabbarPart(
                  indicatorActive: widget.indicatorActive,
                  controller: controller,
                  unselectedLabelColor: widget.unselectedLabelColor,
                  labelColor: widget.labelColor,
                  labelStyle: widget.labelStyle,
                  tabs: widget.tabs.map((e) => getTab(e)).toList(),
                ),
        ),
        if (widget.child != null) widget.child!,
        Expanded(
          child: TabBarView(
            controller: controller,
            physics: widget.physics,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}

class PxTabbarPart extends StatelessWidget {
  final Color indicatorActive;
  final TabController controller;
  final List<Widget> tabs;

  final TextStyle labelStyle;
  final Color labelColor;
  final Color unselectedLabelColor;

  const PxTabbarPart({
    super.key,
    required this.indicatorActive,
    required this.controller,
    required this.tabs,
    this.labelColor = Colors.black,
    this.unselectedLabelColor = Colors.black,
    TextStyle? labelStyle,
  }) : labelStyle = labelStyle ?? const TextStyle();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 2,
      indicatorColor: indicatorActive,
      controller: controller,
      labelPadding: EdgeInsets.zero,
      isScrollable: true,
      labelStyle: labelStyle,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      tabs: tabs,
    );
  }
}
