import 'dart:async';

import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String value = '';
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 30,
          spacing: 30,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Search...', prefixIcon: Icon(Icons.search)),
              onChanged: (searchValue) => _debounceSearch(() {
                if (searchValue.isEmpty) {
                  value = '';
                }
                setState(() {
                  value = '$value / $searchValue ';
                });
              }),
              keyboardType: TextInputType.name,
            ),
            Text('Search Call Happend For : $value  ')
          ],
        ),
      )),
    );
  }

  void _debounceSearch(VoidCallback value) {
    if (timer != null && (timer?.isActive == true)) {
      timer?.cancel();
    }

    timer = Timer(const Duration(milliseconds: 200), () => value());
  }
}
