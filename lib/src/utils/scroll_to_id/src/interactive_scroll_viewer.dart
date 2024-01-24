import 'package:flutter/material.dart';

import 'scroll_content.dart';
import 'scroll_content_with_key.dart';
import 'scroll_to_id.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';

/// InteractiveScrollViewer is required widget for using scroll_to_id.
/// This widget is customized version of 'SingleChildScrollView'.
/// children and scrollToId is required parameter.
class InteractiveScrollViewer extends StatefulWidget {
  final ScrollToId? scrollToId;
  final List<ScrollContent> children;

  /// The axis along which the scroll view scrolls.
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  const InteractiveScrollViewer(
      {required this.children,
      required this.scrollToId,
      this.scrollDirection = Axis.vertical});

  @override
  _InteractiveScrollViewerState createState() =>
      _InteractiveScrollViewerState();
}

class _InteractiveScrollViewerState extends State<InteractiveScrollViewer> {
  List<String> _idList = [];

  @override
  void initState() {
    super.initState();

    /// Set scrollDirection
    widget.scrollToId!.scrollDirection = widget.scrollDirection;

    /// Convert ScrollContent to ScrollContentWithKey
    for (ScrollContent scrollContents in widget.children) {
      if (_idList.contains(scrollContents.id)) {
        throw Exception('Do not use the same id');
      } else {
        _idList.add(scrollContents.id);
      }
      widget.scrollToId!.scrollContentsList
          .add(ScrollContentWithKey.fromWithout(scrollContents));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImprovedScrolling(
      scrollController: widget.scrollToId!.scrollController!,
      enableKeyboardScrolling: true,
      keyboardScrollConfig: const KeyboardScrollConfig(
            spaceScrollAmount: 0
          ),
      child: SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        controller: widget.scrollToId!.scrollController,
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    /// Default
    if (widget.scrollDirection == Axis.vertical) {
      return Column(
        children: widget.scrollToId!.scrollContentsList.map((scrollContents) {
          return buildRepaintBoundary(scrollContents);
        }).toList(),
      );
    } else {
      return Row(
        children: widget.scrollToId!.scrollContentsList.map((scrollContents) {
          return buildRepaintBoundary(scrollContents);
        }).toList(),
      );
    }
  }

  /// This widget is to get the size of its widget.
  RepaintBoundary buildRepaintBoundary(ScrollContentWithKey scrollContents) {
    return RepaintBoundary(
      key: scrollContents.key,
      child: scrollContents.child,
    );
  }
}
