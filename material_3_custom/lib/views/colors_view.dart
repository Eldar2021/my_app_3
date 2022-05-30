import 'package:flutter/material.dart';

import 'buttons_view.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeH10,
            sizeH10,
            sizeH10,
            ColorView(
              colors: [
                scheme.primary,
                scheme.onPrimary,
                scheme.primaryContainer,
                scheme.onPrimaryContainer,
              ],
            ),
            sizeH10,
            sizeH10,
            ColorView(
              colors: [
                scheme.secondary,
                scheme.onSecondary,
                scheme.secondaryContainer,
                scheme.onSecondaryContainer,
              ],
            ),
            sizeH10,
            sizeH10,
            ColorView(
              colors: [
                scheme.tertiary,
                scheme.onTertiary,
                scheme.tertiaryContainer,
                scheme.onTertiaryContainer,
              ],
            ),
            sizeH10,
            sizeH10,
            ColorView(
              colors: [
                scheme.error,
                scheme.onError,
                scheme.errorContainer,
                scheme.onErrorContainer,
              ],
            ),
            sizeH10,
            sizeH10,
            ColorView(
              colors: [
                scheme.background,
                scheme.onBackground,
              ],
            ),
            sizeH10,
            sizeH10,
          ],
        ),
      ),
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: colors
            .map(
              (e) => SizedBox(
                height: 40,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: e,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        sizeW10,
                        sizeW10,
                        Text('$e', style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
