import 'package:flutter/material.dart';

class MultiSelectBottomSheet extends StatefulWidget {
  MultiSelectBottomSheet({super.key});
  
  @override
  State<MultiSelectBottomSheet> createState() => _MultiSelectBottomSheetState();
}

class _MultiSelectBottomSheetState extends State<MultiSelectBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Dummy ${index+1}'),
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
      return MultiSelectBottomSheet();
    }
  );
}