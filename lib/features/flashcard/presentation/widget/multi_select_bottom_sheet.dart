import 'package:flutter/material.dart';

class MultiSelectBottomSheet extends StatefulWidget {
  final List<String> items;
  final List<bool> selectedOrder;
  
  final String? cancelText;
  final String? confirmText;

  const MultiSelectBottomSheet({
    super.key, 
    required this.items,
    required this.selectedOrder,
    this.cancelText,
    this.confirmText,
  }) : assert(items.length == selectedOrder.length);

  @override
  State<MultiSelectBottomSheet> createState() => _MultiSelectBottomSheetState();

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

  void onCancel(BuildContext context) {
    Navigator.pop(context);
  }

  void onConfirm(BuildContext context, /* selectedItems */) {
    Navigator.pop(context /*, selectedItems */);
  }
}

class _MultiSelectBottomSheetState extends State<MultiSelectBottomSheet> {
  bool _showSearch = false;
  late List<String> _items;
  late List<bool> _selectedOrder;

  _MultiSelectBottomSheetState();

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _selectedOrder = List.from(widget.selectedOrder);
  }

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
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _showSearch ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                        ),
                        onChanged: (query) {
                          // TODO: value of checkboxes disappears after filtering
                          var filteredItems = widget.filterItems(query, widget.items);
                          setState(() {
                            _items = filteredItems;
                          });
                        },
                      ),
                    ),
                  ) : Text(
                    'Select',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _showSearch = !_showSearch;
                        });
                      },
                    ),
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
                    value: _selectedOrder[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedOrder[index] = value!;
                      });
                    },
                  );
                }
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => widget.onCancel(context),
                      child: Text(
                        widget.cancelText ?? 'CANCEL',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => widget.onConfirm(context),
                      child: Text(
                        widget.confirmText ?? 'OK',
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