import 'dart:async';

import 'package:flutter/material.dart';

extension InAppNotifierExtension on BuildContext {
  void showTopBanner(InAppNotifierModel content) => InAppNotifier().showBanner(
        this,
        model: content,
      );
}

class InAppNotifier {
  static final InAppNotifier _singleton = InAppNotifier._internal();

  factory InAppNotifier() => _singleton;

  InAppNotifier._internal();

  bool hasListeners = false;
  late GlobalKey<NavigatorState> _navigatorKey;

  Duration streamTimeout = const Duration(seconds: 1);
  final StreamController<InAppNotifierModel> _bannerStream =
      StreamController<InAppNotifierModel>.broadcast();

  late Color _errorColor;
  late Color _warningColor;
  late Color _successColor;
  late Color _infoColor;
  late Color _defaultColor;
  late Color _closeTitleColor;
  late Color _closeIconColor;
  late MemoryImage _closeIcon;

  Future init({
    required GlobalKey<NavigatorState> navigatorKey,
    required Color errorColor,
    required Color warningColor,
    required Color successColor,
    required Color infoColor,
    required Color defaultColor,
    required Color closeTitleColor,
    required Color closeIconColor,
    required MemoryImage closeIcon,
  }) {
    _navigatorKey = navigatorKey;
    _errorColor = errorColor;
    _warningColor = warningColor;
    _successColor = successColor;
    _infoColor = infoColor;
    _defaultColor = defaultColor;
    _closeTitleColor = closeTitleColor;
    _closeIconColor = closeIconColor;
    _closeIcon = closeIcon;

    listenForErrors();
    listenForBanners();
    return Future.value();
  }

  void add(InAppNotifierModel input) => _bannerStream.sink.add(input);

  void clear() {
    _previousEntry?.remove();
    _previousEntry = null;
  }

  void listenForBanners() {
    if (hasListeners) return;

    _bannerStream.stream.listen((event) {
      if (_navigatorKey.currentState?.overlay?.context == null) return;

      OverlayState? overlayState = _navigatorKey.currentState?.overlay;

      showBanner(
        _navigatorKey.currentState?.overlay?.context,
        model: event,
        overlayState: overlayState,
      );
    }, onError: (err) {});
    hasListeners = true;
  }

  void listenForErrors() {
    if (hasListeners) return;

    // ValueStreamService()
    //     .controller
    //     .stream
    //     .where((e) => e.payload.toString().contains("Error"))
    //     .listen((event) {
    //   _bannerStream.sink.add(
    //     InAppNotifierModel(child: Text("${event.payload} - ${event.data}")),
    //   );
    // });
  }

  void showBanner(
    BuildContext? context, {
    required InAppNotifierModel model,
    OverlayState? overlayState,
  }) =>
      _showTopSnackBar(context, model, overlayState: overlayState);

  OverlayEntry? _previousEntry;
  void _showTopSnackBar(
    BuildContext? context,
    InAppNotifierModel model, {
    OverlayState? overlayState,
  }) async {
    if (context == null) return;

    overlayState ??= Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return model.isBanner
            ? TopSnackBar(
                model: model,
                onDismissed: () {
                  overlayEntry.remove();
                  _previousEntry = null;
                  model.onTap?.call();
                },
                defaultColor: _defaultColor,
                errorColor: _errorColor,
                infoColor: _infoColor,
                successColor: _successColor,
                warningColor: _warningColor,
              )
            : InAppModal(
                model: model,
                onDismissed: () {
                  overlayEntry.remove();
                  _previousEntry = null;
                  model.onTap?.call();
                },
                closeTitleColor: _closeTitleColor,
                closeIconColor: _closeIconColor,
                closeIcon: _closeIcon,
              );
      },
    );

    _previousEntry?.remove();
    overlayState.insert(overlayEntry);
    _previousEntry = overlayEntry;
  }

  OverlayEntry? _visibleEntry;
  OverlayEntry addOverlayEntry(
    BuildContext context,
    Widget content, {
    OverlayState? overlayState,
  }) {
    if (_visibleEntry != null && (_visibleEntry?.mounted ?? false))
      _visibleEntry?.remove();

    overlayState ??= Overlay.of(context);
    _visibleEntry = OverlayEntry(builder: (_) => content);
    overlayState.insert(_visibleEntry!);

    return _visibleEntry!;
  }

  void dispose() {
    _bannerStream.close();
  }
}

enum MessageType {
  undefined,
  success,
  info,
  warning,
  error,
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  final InAppNotifierModel model;
  final VoidCallback onDismissed;
  final Color errorColor;
  final Color warningColor;
  final Color successColor;
  final Color infoColor;
  final Color defaultColor;

  const TopSnackBar({
    Key? key,
    required this.model,
    required this.onDismissed,
    required this.errorColor,
    required this.warningColor,
    required this.successColor,
    required this.infoColor,
    required this.defaultColor,
  }) : super(key: key);

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late Animation offsetAnimation;
  late AnimationController animationController;
  double? topPosition;

  @override
  void initState() {
    topPosition = widget.model.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.model.showOutAnimationDuration,
      reverseDuration: widget.model.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed && widget.model.dismissable) {
          await Future.delayed(widget.model.displayDuration);
          if (mounted) {
            animationController.reverse();
            setState(() {
              topPosition = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    if (mounted) {
      animationController.forward();
    }
  }

  Widget _getSkin(
    BuildContext context,
    Widget content,
  ) {
    Color skinColor = Colors.black;
    if (widget.model.background != null) {
      skinColor = widget.model.background!;
    } else {
      switch (widget.model.messageType) {
        case MessageType.error:
          skinColor = widget.errorColor;
          break;
        case MessageType.warning:
          skinColor = widget.warningColor;
          break;
        case MessageType.success:
          skinColor = widget.successColor;
          break;
        case MessageType.info:
          skinColor = widget.infoColor;
          break;
        default:
          skinColor = widget.defaultColor;
          break;
      }
    }

    return Container(
      padding: widget.model.contentPadding ??
          EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            right: widget.model.rightPadding,
            left: widget.model.leftPadding,
            bottom: 10,
          ),
      constraints:
          BoxConstraints(minHeight: 50 + MediaQuery.of(context).padding.top),
      //height: 50 + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: skinColor,
      ),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.model.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: 0,
      right: 0,
      left: 0,
      // top: topPosition,
      // left: widget.model.leftPadding,
      // right: widget.model.rightPadding,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: GestureDetector(
          onTap: widget.model.dismissable
              ? () {
                  if (mounted) {
                    widget.model.onTap?.call();
                    animationController.reverse();
                  }
                }
              : null,
          child: Material(
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            color: Colors.transparent,
            child: _getSkin(context, widget.model.child),
          ),
        ),
      ),
    );
  }
}

class InAppModal extends StatefulWidget {
  final InAppNotifierModel model;
  final VoidCallback onDismissed;
  final Color closeTitleColor;
  final Color closeIconColor;
  final MemoryImage closeIcon;

  const InAppModal({
    Key? key,
    required this.model,
    required this.onDismissed,
    required this.closeTitleColor,
    required this.closeIconColor,
    required this.closeIcon,
  }) : super(key: key);

  @override
  _InAppModalState createState() => _InAppModalState();
}

class _InAppModalState extends State<InAppModal>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  double opacity = 0;

  @override
  void initState() {
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.model.showOutAnimationDuration,
      reverseDuration: widget.model.hideOutAnimationDuration,
    );

    Tween<double> offsetTween = Tween<double>(
      begin: 0.9,
      end: 1,
    );

    animation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
        reverseCurve: Curves.easeIn,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed && widget.model.dismissable) {
          await Future.delayed(widget.model.displayDuration);
          if (mounted) {
            setState(() {
              opacity = 0;
            });
            animationController.reverse();
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          opacity = 1;
        });
        animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: widget.model.showOutAnimationDuration,
      curve: Curves.linearToEaseOut,
      child: GestureDetector(
        onTap: widget.model.dismissable
            ? () {
                if (mounted) {
                  widget.model.onTap?.call();
                  animationController.reverse();
                  setState(() {
                    opacity = 0;
                  });
                }
              }
            : null,
        child: Container(
          color: Colors.black45,
          child: SafeArea(
            top: true,
            bottom: true,
            child: ScaleTransition(
              scale: animation as Animation<double>,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Material(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          child: Container(
                            padding: widget.model.contentPadding,
                            color:
                                widget.model.background ?? Colors.transparent,
                            child: widget.model.child,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  if (widget.model.dismissable)
                    Positioned(
                      top: 26,
                      right: 26,
                      child: GestureDetector(
                        onTap: () {
                          animationController.reverse();
                          setState(() {
                            opacity = 0;
                          });
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.closeTitleColor,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: Image(
                            color: widget.closeIconColor,
                            image: widget.closeIcon,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InAppNotifierModel {
  final Widget child;
  final EdgeInsets? contentPadding;
  final MessageType messageType;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration displayDuration;
  final double additionalTopPadding;
  final VoidCallback? onTap;
  final double leftPadding;
  final double rightPadding;
  final bool isBanner;
  final bool dismissable;
  final Color? background;

  InAppNotifierModel({
    required this.child,
    this.messageType = MessageType.info,
    this.contentPadding,
    Duration? showOutAnimationDuration,
    Duration? hideOutAnimationDuration,
    Duration? displayDuration,
    this.additionalTopPadding = 16.0,
    this.onTap,
    this.leftPadding = 16,
    this.rightPadding = 16,
    this.isBanner = true,
    this.dismissable = true,
    this.background,
  })  : showOutAnimationDuration = showOutAnimationDuration ??
            (isBanner
                ? const Duration(milliseconds: 500)
                : const Duration(milliseconds: 500)),
        hideOutAnimationDuration = hideOutAnimationDuration ??
            (isBanner
                ? const Duration(milliseconds: 550)
                : const Duration(milliseconds: 200)),
        displayDuration = displayDuration ??
            (isBanner
                ? const Duration(milliseconds: 3000)
                : const Duration(days: 1));
}
