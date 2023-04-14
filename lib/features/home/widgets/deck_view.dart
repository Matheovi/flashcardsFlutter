import 'package:flutter/material.dart';

class DeckView extends StatefulWidget {
  final List<Widget> children;

  const DeckView({
    super.key,
    required this.children
  });

  @override
  State<StatefulWidget> createState() => _DeckViewState();
}

class _DeckViewState extends State<DeckView> {
  /// list or two-column grid
  final List<bool> _selectedGridLayout = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ToggleButtons(
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedGridLayout.length; ++i) {
                  _selectedGridLayout[i] = i == index;
                }
              });
            },
            isSelected: _selectedGridLayout,
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: _selectedGridLayout.first ? 1 : 2,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}