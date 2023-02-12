import '../../../view/added_item_type/added_category_view.dart';
import '../../../view/bottom_bar/view/bottom_bar_view.dart';
import '../../../view/product_selection_view/view/product_is_empty_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case BottomBarView.routeName:
        return FadeTransitionPageRoute(BottomBarView(), settings: args);
      case AddedCategory.routeName:
        return FadeTransitionPageRoute(const AddedCategory(), settings: args);
      case ProductIsEmptyView.routeName:
        return FadeTransitionPageRoute(const ProductIsEmptyView(),
            settings: args);
      default:
        return MaterialPageRoute(
          builder: (context) => const SizedBox(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  CupertinoPageRoute cupertinoNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (BuildContext context) => widget);
  }
}

class FadeTransitionPageRoute extends CupertinoPageRoute {
  final Widget widget;

  FadeTransitionPageRoute(this.widget, {RouteSettings? settings})
      : super(settings: settings, builder: (BuildContext context) => widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: widget);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    Animation<double> onlyForwardAnimation;
    switch (animation.status) {
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        onlyForwardAnimation = kAlwaysCompleteAnimation;
        break;
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        onlyForwardAnimation = animation;
        break;
    }
    return theme.buildTransitions(
        this, context, onlyForwardAnimation, secondaryAnimation, child);
  }
}
