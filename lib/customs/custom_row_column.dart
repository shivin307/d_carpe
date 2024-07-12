import 'package:flutter/material.dart';

Widget expandedRow(bool isRow, Widget child, {int flex = 1}) {
  if (isRow) {
    return Expanded(flex: flex, child: child);
  } else {
    return child;
  }
}

Widget expandedColumn(bool isColumn, Widget child, {int flex = 1}) {
  if (isColumn) {
    return Expanded(flex: flex, child: child);
  } else {
    return child;
  }
}

class RowColumnWidget extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final GroupType grouptype;

  const RowColumnWidget({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.grouptype,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    if (grouptype == GroupType.row) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    }
  }
}

enum GroupType { column, row }
