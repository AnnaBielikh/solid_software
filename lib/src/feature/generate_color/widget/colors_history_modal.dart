import 'package:flutter/material.dart';
import 'package:solid_software/src/feature/generate_color/widget/modal_header.dart';

/// Modal bottom sheet with color history
class ColorsHistoryModal extends StatelessWidget {
  /// constructor
  const ColorsHistoryModal({
    required this.backgroundColors,
    required this.onTap,
    super.key,
  });

  /// List of background colors
  final List<Color> backgroundColors;

  /// Сolor selection function
  final void Function({required Color color}) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ModalHeader(
          title: 'Colors history',
        ),
        Flexible(
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: backgroundColors.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 30,
                  height: 20,
                  color: backgroundColors[index],
                ),
                title: Text(backgroundColors[index].toString()),
                onTap: () {
                  onTap(color: backgroundColors[index]);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox.shrink();
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).viewPadding.bottom,
        ),
      ],
    );
  }
}
