import 'package:flutter/material.dart';

import 'buttons_view.dart';

class TypograpScreen extends StatelessWidget {
  const TypograpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: cScheme.onSurface);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeH20,
            Typograp('Display Large', style: textTheme.displayLarge!),
            Typograp('Display Medium', style: textTheme.displayMedium),
            Typograp('Display Small', style: textTheme.displaySmall),
            Typograp('Headline Large', style: textTheme.headlineLarge),
            Typograp('Headline Medium', style: textTheme.headlineMedium),
            Typograp('Headline Small', style: textTheme.headlineSmall),
            Typograp('Title Large', style: textTheme.titleLarge),
            Typograp('Title Medium', style: textTheme.titleMedium),
            Typograp('Title Small', style: textTheme.titleSmall),
            Typograp('Label Large', style: textTheme.labelLarge),
            Typograp('Label Medium', style: textTheme.labelMedium),
            Typograp('Label Small', style: textTheme.labelSmall),
            Typograp('Body Large', style: textTheme.bodyLarge),
            Typograp('Body Medium', style: textTheme.bodyMedium),
            Typograp('Body Small', style: textTheme.bodySmall),
            Typograp('Headline 1', style: textTheme.headline1),
            Typograp('Headline 2', style: textTheme.headline2),
            Typograp('Headline 3', style: textTheme.headline3),
            Typograp('Headline 4', style: textTheme.headline4),
            Typograp('Headline 5', style: textTheme.headline5),
            Typograp('Headline 6', style: textTheme.headline6),
            Typograp('Subtitle 1', style: textTheme.subtitle1),
            Typograp('Subtitle 2', style: textTheme.subtitle2),
            Typograp('Body 1', style: textTheme.bodyText1),
            Typograp('Body 2', style: textTheme.bodyText2),
            Typograp('Button', style: textTheme.button),
            Typograp('Caption', style: textTheme.caption),
            Typograp('Overline', style: textTheme.overline),
            sizeH20,
          ],
        ),
      ),
    );
  }
}

class Typograp extends StatelessWidget {
  const Typograp(this.text, {this.style, super.key});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        title: Text(text, style: style),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypogItem('Weight', '${style?.fontWeight}'),
            TypogItem('Size', '${style?.fontSize}'),
            TypogItem('Letter spacing', '${style?.letterSpacing}'),
          ],
        ),
      ),
    );
  }
}

class TypogItem extends StatelessWidget {
  const TypogItem(this.title, this.val, {super.key});

  final String title;
  final String val;

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: tTheme.bodyLarge),
        Text(val, style: tTheme.bodySmall),
      ],
    );
  }
}
