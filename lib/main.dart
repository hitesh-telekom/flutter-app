import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:test_app/data/tariffs.dart';
import 'package:test_app/pages/TariffListingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TariffListingPage(title: 'Tariff Listing', tariffs: tariffs),
    );
  }

  createStaticTariffs() {}
}

var tariffs = <Tariff>[
  Tariff(
    id: 'best_l',
    name: 'Best L',
    isSelected: true,
    characteristics: <Characteristic>[
      Characteristic(name: "data", label: "Data", value: "20GB"),
      Characteristic(name: "Voice", label: "Voice", value: "Unlimited"),
    ],
    notes: <Note>[
      Note(title: "A Warning note!", description: "An optional text"),
      Note(title: "An Info note!", description: "An optional text")
    ]
  ),
  Tariff(
      id: 'best_m',
      name: 'Best M',
      notes: <Note>[
        Note(title: "A Warning note!", description: "An optional text")
      ]
  )
];
