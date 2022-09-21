import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int currentIndex = 0;

  DragController dragController = DragController();
  final TextEditingController _titleController1 =
      TextEditingController(text: "111");
  final FocusNode focusNode1 = FocusNode();
  final TextEditingController _titleController2 =
      TextEditingController(text: "222");
  final FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    webComposeEvent([focusNode1, focusNode2]);
    dragController.showWidget();
    super.initState();
  }

  @override
  void dispose() {
    _titleController1.dispose();
    focusNode1.dispose();
    _titleController2.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  void webComposeEvent(
    List<FocusNode> focusNodeList,
  ) {
    if (!kIsWeb) return;

    html.window.document.addEventListener("compositionstart", (event) {
      focusNodeList.forEach((_focusNode) {
        if (!_focusNode.hasFocus) return;
        _focusNode.skipTraversal = true;
      });
    });
    html.window.document.addEventListener("compositionend", (event) {
      focusNodeList.forEach((_focusNode) {
        if (!_focusNode.skipTraversal) return;
        _focusNode.skipTraversal = false;
      });
    });
  }

  Offset _dialogOffset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Stack(
          children: [
            Column(
              children: [
                // TableCalendar(
                //   locale: 'jp_JP',
                //   firstDay: DateTime.utc(2010, 10, 16),
                //   lastDay: DateTime.utc(2030, 3, 14),
                //   focusedDay: DateTime.now(),
                //   onDaySelected: (selectedDay, focusedDay) {},
                // ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      focusNode: focusNode1,
                      controller: _titleController1,
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      autovalidateMode: AutovalidateMode.always,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      focusNode: focusNode2,
                      controller: _titleController2,
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      autovalidateMode: AutovalidateMode.always,
                    )),
                  ],
                ),
                Container(
                  child: ListTile(
                    title: Text('title1'),
                    leading: Icon(Icons.router),
                    onTap: () {
                      context.goNamed('details', params: {'fid': 'title1'});
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
            ),
            // DraggableWidget(
            //   bottomMargin: 80,
            //   topMargin: 80,
            //   intialVisibility: false,
            //   horizontalSpace: 20,
            //   shadowBorderRadius: 50,
            //   child: Container(
            //     height: 100,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //     ),
            //   ),
            //   initialPosition: AnchoringPosition.bottomLeft,
            //   dragController: dragController,
            // ),
            Container(
              alignment: Alignment(_dialogOffset.dx, _dialogOffset.dy),
              child: Draggable(
                feedback: Material(
                  //ドラッグ中に表示するWidgetを設定
                  child: Container(
                    child: const Text('ダイアログ'),
                    color: Colors.red.withOpacity(0.5),
                    alignment: Alignment.center,
                    width: 300,
                    height: 50,
                  ),
                ),
                onDragUpdate: (DragUpdateDetails details) {
                  print("Draggable.onUpdate: details delta: ${details.delta}");
                  print("Draggable.onUpdate: details local: ${details.localPosition}");
                  print("Draggable.onUpdate: details global: ${details.globalPosition}");
                  setState(() {
                    _dialogOffset = details.localPosition;
                  });
                },
                onDraggableCanceled: (Velocity velocity, Offset offset){
                  setState(() => _dialogOffset = offset);
                },
                child: Container(
                  child: const Text('ここからドラッグ'),
                  color: Colors.red,
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.d
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
