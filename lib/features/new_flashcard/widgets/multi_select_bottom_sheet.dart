import 'package:flutter/material.dart';

class MultiSelectBottomSheet extends StatefulWidget {
  final List<String> items;

  MultiSelectBottomSheet({
    required this.items,
  });

  @override
  // ignore: no_logic_in_create_state
  State<MultiSelectBottomSheet> createState() => _MultiSelectBottomSheetState(items);

  List<String> filterItems(String? query, List<String> allItems) {
    if (query != null && query.trim().isNotEmpty) {
      List<String> filteredItems = [];
      for (var item in allItems) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredItems.add(item);
        }
      }
      return filteredItems;
    } else {
      return allItems;
    }
  }
}

class _MultiSelectBottomSheetState extends State<MultiSelectBottomSheet> {
  bool _showSearch = false;
  late List<String> _items;

  _MultiSelectBottomSheetState(this._items);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.4,
      maxChildSize: 0.7,
      initialChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _showSearch ? Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search',
                      ),
                      onChanged: (query) {
                        var filteredItems = widget.filterItems(query, widget.items);
                        setState(() {
                          _items = filteredItems;
                        });
                      },
                    ),
                  ) : Text(
                    'Select',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _showSearch = !_showSearch;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(_items[index]),
                    value: false,
                    onChanged: (bool? value) {},
                  );
                }
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        'CANCEL',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        'OK',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

void showMultiSelectBottomSheet({required BuildContext context}) async {
  return await showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return MultiSelectBottomSheet(
        items: [
          "Apple",
          "Banana",
          "Orange",
          "Watermelon",
        ]
      );
    }
  );
}