import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:test_app/data/tariffs.dart';
import 'package:test_app/main.dart';

class TariffListingPage extends StatefulWidget {
  final String? title;
  final List<Tariff>? tariffs;

  const TariffListingPage({super.key, this.title, this.tariffs});

  @override
  State<TariffListingPage> createState() => _TariffListingPageState();
}

class _TariffListingPageState extends State<TariffListingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Title'),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: tariffs
            .map((tariff) => TariffCard(
                  tariff: tariff,
                ))
            .toList(),
      ),
    );
  }
}

class TariffCard extends StatelessWidget {
  final Tariff tariff;

  const TariffCard({
    super.key,
    required this.tariff,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          title: Text(
            '${tariff.name}',
          ),
          subtitle: Column(
            children: [
              if (tariff.characteristics != null &&
                  tariff.characteristics!.isNotEmpty)
                Characteristics(tariff: tariff),
              if (tariff.notes != null)
                Notes(
                  tariff: tariff,
                )
            ],
          )),
    );
  }
}

class Characteristics extends StatelessWidget {
  const Characteristics({
    super.key,
    required this.tariff,
  });

  final Tariff tariff;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 10,
          color: Colors.grey[600],
        ),
        for (var characteristic in tariff.characteristics!)
          CharacteristicRow(characteristic: characteristic)
      ],
    );
  }
}

class Notes extends StatelessWidget {
  Notes({
    super.key,
    required this.tariff,
  });

  final Tariff tariff;
  final headerStyle = TextStyle(
    color: Colors.purple[600],
  );
  final contentStyle = TextStyle(
    color: Colors.purple[200],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 10,
          color: Colors.grey[600],
        ),
        Accordion(
          headerBackgroundColor: Colors.purple[200],
          maxOpenSections: tariff.notes!.length,
          headerPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 3,
          ),
          paddingBetweenClosedSections: 10,
          paddingListBottom: 0,
          paddingBetweenOpenSections: 10,
          paddingListHorizontal: 0,
          paddingListTop: 10,
          contentBackgroundColor: Colors.grey[300],
          children: [
            for (var note in tariff.notes!)
              AccordionSection(
                header: Text('${note.title}', style: headerStyle),
                rightIcon: const Icon(Icons.info_outline_rounded),
                content: Text(
                  '${note.description}',
                  style: contentStyle,
                ),
              )
          ],
        ),
      ],
    );
  }
}

class CharacteristicRow extends StatelessWidget {
  const CharacteristicRow({
    super.key,
    required this.characteristic,
  });

  final Characteristic characteristic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
          child: Text(
            '${characteristic.value}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
          child: Text(
            '${characteristic.name}',
          ),
        )
      ],
    );
  }
}
