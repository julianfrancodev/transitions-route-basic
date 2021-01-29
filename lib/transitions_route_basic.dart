import 'package:flutter/material.dart';

/// type of animations
enum AnimationType { nomal, fadeIn }

/// Main class, [context], is the BuildContext from App
/// [child] widget to navigate from page
/// [animation] type of animation from enum
class TransitionsRouteBasic {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool repleacement;

  /// Constructor that provides setting from attributes
  TransitionsRouteBasic(
      {@required this.context,
      @required this.child,
      this.repleacement = false,
      this.duration = const Duration(milliseconds: 300),
      this.animation = AnimationType.nomal}) {

    /// Switch to validate type of animation to use.
    switch (this.animation) {
      case AnimationType.nomal:
        this._normalTransition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }
  }

  /// basic push from page
  void _pushPage(Route route) => Navigator.push(context, route);

  /// push repleacement from page (No back button, No back apge)
  void _pushReplacement(Route route) =>
      Navigator.pushReplacement(context, route);

  /// Normal transition to navigate from page
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => this.child);
    (this.repleacement) ? this._pushReplacement(route) : this._pushPage(route);
  }

  /// Fade transtion to navigate from page
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => this.child,
        transitionDuration: this.duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut)),
            child: child,
          );
        });

    (this.repleacement) ? this._pushReplacement(route) : this._pushPage(route);
  }
}
