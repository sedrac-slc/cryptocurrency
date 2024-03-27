import 'package:cryptocurrency/models/currency_model.dart';
import 'package:cryptocurrency/repositories/currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  late NumberFormat numberFormat;

  late List<Currency> currencies;
  List<Currency> selecteds = [];

  @override
  void initState() {
    super.initState();
    currencies = CurrencyRepository.currencies;
    numberFormat = NumberFormat.compactCurrency(locale: "pt_AO", name: "AO");
  }

  appBarCreator() {
    if (selecteds.isEmpty) {
      return AppBar(
        centerTitle: true,
        title: const Text("App Currency"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
    }

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => setState(() {
          selecteds = [];
        }),
      ),
      title: Text("${selecteds.length} selecionados"),
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      elevation: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCreator(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          bool isSelected = selecteds.contains(currencies[index]);

          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: isSelected
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : Image.asset(
                    currencies[index].icone,
                    width: 30,
                    height: 30,
                  ),
            title: Text(
              currencies[index].name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(numberFormat.format(currencies[index].price)),
            selected: isSelected,
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (isSelected)
                    ? selecteds.remove(currencies[index])
                    : selecteds.add(currencies[index]);
              });
            },
          );
        },
        padding: const EdgeInsets.all(10.0),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: currencies.length,
      ),
      floatingActionButton: selecteds.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Favoritar"),
              icon: const Icon(Icons.star),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
