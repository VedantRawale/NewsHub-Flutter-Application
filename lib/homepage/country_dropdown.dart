import 'package:flutter/material.dart';

import '../Provider/country_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';


class CountryDropDown extends StatefulWidget {
  const CountryDropDown({super.key});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  @override
  Widget build(BuildContext context) {
    CountryProvider countryProvider = Provider.of<CountryProvider>(context);
    print("${countryProvider.country}at dropdown");
    return Consumer<CountryProvider>(
        builder: (context, countryProvider, child) {
      print("${countryProvider.country}at dropdown later");
      return DropdownButton(
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.black,
          ),
          value: countryProvider.country,
          dropdownColor: Colors.white,
          items: countryMap.keys.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(
                countryMap[items]!,
                style: const TextStyle(color: Colors.brown),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              countryProvider.setCountry(value!);
            });
          });
    });
  }
}
