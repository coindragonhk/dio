import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../res/R.dart';

class CustomRefreshHeader extends StatefulWidget {
  final RefreshStatus? refreshStatus;

  const CustomRefreshHeader({super.key, this.refreshStatus});

  @override
  State<CustomRefreshHeader> createState() => _CustomRefreshHeaderState();
}

class _CustomRefreshHeaderState extends State<CustomRefreshHeader>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    super.initState();
    /*
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.repeat();
     */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 16.h),
      child: RotationTransition(
        turns:
            _animation, // Tween(begin: 0.0, end: 1.0).animate(animationController),
        child: Image.asset(
          R.drawable.ic_dragon_refresh,
          width: 105.w,
          height: 85.h,
        ),
      ),

      // AnimatedBuilder(
      //   animation: animationController,
      //   child: Image.asset(
      //     R.drawable.ic_dragon_refresh,
      //     width: 105.w,
      //     height: 85.h,
      //   ),
      //   builder: (_, child) {
      //     return Transform.rotate(
      //       angle: widget.refreshStatus != null && widget.refreshStatus != RefreshStatus.refreshing ? 0 : animationController.value * 18,
      //       child: child,
      //     );
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}
