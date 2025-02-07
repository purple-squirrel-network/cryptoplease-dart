import 'package:cryptoplease/app/components/decorated_window_header.dart';
import 'package:cryptoplease_ui/cryptoplease_ui.dart';
import 'package:flutter/material.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({
    Key? key,
    this.title,
    required this.child,
    this.backButton,
    this.hasAppBarBorder = true,
  }) : super(key: key);

  final Widget child;
  final String? title;
  final Widget? backButton;
  final bool hasAppBarBorder;

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    return CpTheme(
      theme: const CpThemeData.dark(),
      child: Scaffold(
        appBar: CpAppBar(
          hasBorder: hasAppBarBorder,
          leading: backButton,
          title: title != null
              ? Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : null,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: DecoratedWindowHeader(),
            ),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}
