import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FullScreenPopUp extends ModalRoute {
  final String title;
  final String description;
  final VoidCallback onTap;

  FullScreenPopUp({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onTap();
              },
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://via.placeholder.com/400x600.png?text=Placeholder+Image',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 25,
                    right: 5,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Add your dialog content here
                ],
              ))
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         IconButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           icon: Icon(Icons.close, color: Colors.white),
          //         ),
          //       ],
          //     ),
          //     Text(
          //       title,
          //       style: const TextStyle(color: Colors.white, fontSize: 40.0),
          //     ),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     Text(description,
          //         style: const TextStyle(color: Colors.white, fontSize: 18)),
          //     const SizedBox(
          //       height: 30,
          //     ),
          //     ElevatedButton.icon(
          //       onPressed: () {
          //         Navigator.pop(context, ['']);
          //       },
          //       icon: const Icon(Icons.close),
          //       label: const Text('Close'),
          //     )
          //   ],
          // ),
          ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        // add scale animation
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
