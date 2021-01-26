import 'package:flutter/material.dart';

enum AnimationType { nomal, fadeIn }

class TransitionsRouteBasic {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool repleacement;

  TransitionsRouteBasic(
      {@required this.context,
      @required this.child,
      this.repleacement = false,
      this.duration = const Duration(milliseconds: 300),
      this.animation = AnimationType.nomal}) {
    switch (this.animation) {
      case AnimationType.nomal:
        this._normalTransition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }
  }

  void _pushPage(Route route) => Navigator.push(context, route);

  void _pushReplacement(Route route) =>
      Navigator.pushReplacement(context, route);

  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => this.child);
    (this.repleacement) ? this._pushReplacement(route) : this._pushPage(route);
  }

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
