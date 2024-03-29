import 'package:flutter/material.dart';
import 'package:news_blocks/news_blocks.dart';

/// {@template divider_horizontal}
/// A reusable divider horizontal block widget.
/// {@endtemplate}
class DividerHorizontal extends StatelessWidget {
  /// {@macro divider_horizontal}
  const DividerHorizontal({super.key, required this.block});

  /// The associated [DividerHorizontalBlock] instance.
  final DividerHorizontalBlock block;

  @override
  Widget build(BuildContext context) => const Divider();
}
