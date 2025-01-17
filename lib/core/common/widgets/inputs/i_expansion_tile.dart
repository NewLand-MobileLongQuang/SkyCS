import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';

class IExpansionTile extends StatefulWidget {
  IExpansionTile({
    required this.title,
    required this.children,
    required this.trailingExpansionTrue,
    required this.trailingExpansionFalse,
    this.isCheck,
    super.key,
  });

  bool? isCheck;
  final String title;
  final List<Widget> children;
  final Widget trailingExpansionTrue;
  final Widget trailingExpansionFalse;

  @override
  State<IExpansionTile> createState() => _IExpansionTileState();
}

class _IExpansionTileState extends State<IExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.symmetric(horizontal:8),
      visualDensity: const VisualDensity(vertical: -4),
      shape: const Border(),
      trailing: widget.isCheck == false
          ? widget.trailingExpansionFalse
          : widget.trailingExpansionTrue,
      collapsedBackgroundColor: AppColors.greenLightColor,
      onExpansionChanged: (bool expanded){
        setState(() {
          widget.isCheck = expanded;
        });
      },
      title: Text(
        widget.title,
        style: AppTextStyles.textStyleInterW500S14Black,
      ),
      children: widget.children,
    );
  }
}
