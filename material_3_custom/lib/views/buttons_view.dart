import 'package:flutter/material.dart';

import '../constant/buttons.dart';

const sizeH10 = SizedBox(height: 10);
const sizeH20 = SizedBox(height: 20);
const sizeW10 = SizedBox(width: 10);

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final buttons = Buttons.instance;
    final eln = buttons.eln();
    final elf = buttons.elf(scheme);
    final elt = buttons.elt(scheme);
    final ot = buttons.ot();
    final tx = buttons.tx();
    final fl = buttons.fl();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeH10,
            RowItem(eln, 'ElevatedButton Normal'),
            RowItem(elf, 'ElevatedButton Filled'),
            RowItem(elt, 'ElevatedButton Tonal'),
            RowItem(ot, 'OutlinedButton'),
            RowItem(tx, 'TextButton'),
            RowItem(fl, 'FloatingActionButton'),
            const Card(
              margin: EdgeInsets.all(14),
              child: SimpleListTile('List Tile With Card'),
            ),
            sizeH20,
            const SimpleListTile('List Tile'),
            sizeH20,
          ],
        ),
      ),
    );
  }
}

class SimpleListTile extends StatelessWidget {
  const SimpleListTile(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_time_outlined),
      title: Text(text),
      trailing: const Icon(Icons.vertical_align_bottom),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem(this.widgets, this.text, {super.key});

  final List<Widget> widgets;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text(text, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
        ),
      ),
    );
  }
}
