// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/ui/styles/app_text_style.dart';
import 'menu_enum.dart';

class MenuButton extends StatelessWidget {
  final Menu menu;
  final Menu? menuSelected;
  final ValueChanged<Menu> onPressed;
  const MenuButton({
    Key? key,
    required this.menu,
    this.menuSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = menuSelected == menu;
    return LayoutBuilder(
      builder: (_, constraints) {
        return Visibility(
          visible: constraints.maxWidth != 90,
          replacement: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFFFF5E2),
                  )
                : null,
            child: Tooltip(
              message: menu.label,
              child: IconButton(
                onPressed: () => onPressed(menu),
                icon: Image.asset(
                    'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}'),
              ),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed(menu),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: isSelected
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFFFFF5E2),
                      )
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                          'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      menu.label,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected
                          ? context.appTextStyles.textBold
                          : context.appTextStyles.textRgular,
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
