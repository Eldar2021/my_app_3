import 'package:flutter/material.dart';

const sizeH10 = SizedBox(height: 10);
const sizeW10 = SizedBox(width: 10);

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeH10,
            Text('ElevatedButton', style: Theme.of(context).textTheme.bodyLarge),
            sizeH10,
            const ElevetedNormal(),
            sizeH10,
            const ElevetedFilled(),
            sizeH10,
            const ElevetedTonal(),
            sizeH10,
            sizeH10,
            Text('OutlinedButton', style: Theme.of(context).textTheme.bodyLarge),
            sizeH10,
            const OutLineButton(),
            sizeH10,
            sizeH10,
            Text('TextButton', style: Theme.of(context).textTheme.bodyLarge),
            sizeH10,
            const TextButtons(),
            sizeH10,
            sizeH10,
            Text('FloatingActionButton', style: Theme.of(context).textTheme.bodyLarge),
            sizeH10,
            const FloatingButton(),
            sizeH10,
            sizeH10,
            const Card(
              child: ListTile(
                leading: Icon(Icons.access_time_outlined),
                title: Text('ListTile in Card'),
                trailing: Icon(Icons.vertical_align_bottom),
              ),
            ),
            sizeH10,
            sizeH10,
            const ListTile(
              leading: Icon(Icons.access_time_outlined),
              title: Text('ListTile with out Card'),
              trailing: Icon(Icons.vertical_align_bottom),
            ),
            sizeH10,
            sizeH10,
          ],
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton.small(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Create"),
        ),
      ],
    );
  }
}

class TextButtons extends StatelessWidget {
  const TextButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('TextButton'),
        ),
        TextButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () {},
          label: const Text('Icon'),
        ),
        const TextButton(
          onPressed: null,
          child: Text('TextButton'),
        ),
      ],
    );
  }
}

class OutLineButton extends StatelessWidget {
  const OutLineButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined'),
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () {},
          label: const Text('Icon'),
        ),
        const OutlinedButton(
          onPressed: null,
          child: Text('Outlined'),
        ),
      ],
    );
  }
}

class ElevetedTonal extends StatelessWidget {
  const ElevetedTonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
            primary: Theme.of(context).colorScheme.secondaryContainer,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: () {},
          child: const Text('Tonal'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
            primary: Theme.of(context).colorScheme.secondaryContainer,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: () {},
          label: const Text('Icon'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
            primary: Theme.of(context).colorScheme.secondaryContainer,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: null,
          child: const Text('Tonal'),
        ),
      ],
    );
  }
}

class ElevetedFilled extends StatelessWidget {
  const ElevetedFilled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
          child: const Text('Filled'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
          label: const Text('Icon'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: null,
          child: const Text('Filled'),
        ),
      ],
    );
  }
}

class ElevetedNormal extends StatelessWidget {
  const ElevetedNormal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () {},
          label: const Text('Icon'),
        ),
        const ElevatedButton(
          onPressed: null,
          child: Text('Elevated'),
        ),
      ],
    );
  }
}
