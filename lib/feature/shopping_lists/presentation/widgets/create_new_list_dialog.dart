import 'package:emoji_selector/emoji_selector.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shopping_list.dart';

Future<void> showCreateNewListDialog(BuildContext context) async {
  String emoji = '😊';
  Color selectedColor = Colors.blue;
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<String?> error = ValueNotifier(null);

  return showDialog(
    context: context,
    builder: (ctx) =>
        AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Create new list'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: [
                    Row(
                      children: [
                        const Text('List name: '),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5,
                          child: TextField(
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    ValueListenableBuilder(valueListenable: error,
                        builder: (_, error, __) =>
                        error != null
                            ? Text(error, style: const TextStyle(color: Colors.red),)
                            : const SizedBox()),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        const Text('Emoji: '),
                        const SizedBox(width: 12),
                        if (emoji != '') Text(emoji),
                        const SizedBox(width: 12),
                        ElevatedButton(
                            onPressed: () {
                              _showEmojiKeyboard(context).then((value) =>
                                  setState(
                                          () =>
                                      emoji =
                                          (value as EmojiData?)?.char ??
                                              emoji));
                            },
                            child: const Text('Pick emoji'))
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        const Text('Color: '),
                        const SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: selectedColor),
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                            onPressed: () {
                              ColorPicker(
                                color: selectedColor,
                                pickersEnabled: const {
                                  ColorPickerType.both: false,
                                  ColorPickerType.primary: false,
                                  ColorPickerType.accent: false,
                                  ColorPickerType.bw: false,
                                  ColorPickerType.custom: false,
                                  ColorPickerType.wheel: true,
                                },
                                onColorChanged: (Color color) {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                },
                              ).showPickerDialog(
                                context,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: const Text('Select color'))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.of(context).pop(ShoppingList(
                      id: 0,
                      name: controller.text,
                      emoji: emoji,
                      color: selectedColor,
                      isActive: true));
                } else {
                  error.value = 'You must enter list name first';
                }
              },
              child: const Text('Create'),
            )
          ],
        ),
  );
}

Future<void> _showEmojiKeyboard(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 256,
        child: SingleChildScrollView(
          child: EmojiSelector(
            onSelected: (emoji) {
              Navigator.of(context).pop(emoji);
            },
          ),
        ),
      );
    },
  );
}
