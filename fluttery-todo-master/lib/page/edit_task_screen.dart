import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:todo/scopedmodel/todo_list_model.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/component/iconpicker/icon_picker_builder.dart';
import 'package:todo/component/colorpicker/color_picker_builder.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskId;
  final String taskName;
  final Color color;
  final IconData icon;

  EditTaskScreen({
    required this.taskId,
    required this.taskName,
    required this.color,
    required this.icon,
  });

  @override
  State<StatefulWidget> createState() {
    return _EditCardScreenState();
  }
}

class _EditCardScreenState extends State<EditTaskScreen> {
  late String taskName;
  late Color taskColor;
  late IconData taskIcon;

  final btnSaveTitle = "Save Changes";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    taskName = widget.taskName;
    taskColor = widget.color;
    taskIcon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TodoListModel>(
      builder: (BuildContext context, Widget? child, TodoListModel model) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Edit Category',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black26,
            ),
            backgroundColor: Colors.white, 
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 36.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category will help you group related task!',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: taskName,
                  onChanged: (text) {
                    setState(
                      () => taskName = text,
                    );
                  },
                  cursorColor: taskColor,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Category Name...',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 36.0),
                ),
                Container(
                  height: 26.0,
                ),
                Row(
                  children: [
                    ColorPickerBuilder(
                      color: taskColor,
                      onColorChanged: (newColor) => setState(
                        () => taskColor = newColor,
                      ),
                    ),
                    Container(
                      width: 22.0,
                    ),
                    IconPickerBuilder(
                      iconData: taskIcon,
                      highlightColor: taskColor,
                      action: (newIcon) => setState(
                        () => taskIcon = newIcon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return FloatingActionButton.extended(
                heroTag: 'fab_new_card',
                icon: Icon(Icons.save),
                backgroundColor: taskColor,
                label: Text(btnSaveTitle),
                onPressed: () {
                  if (taskName.isEmpty) {
                    final snackBar = SnackBar(
                      content: Text(
                          'Ummm... It seems that you are trying to add an invisible task which is not allowed in this realm.'),
                      backgroundColor: taskColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // _scaffoldKey.currentState.showSnackBar(snackBar);
                  } else {
                    model.updateTask(
                      Task(
                        taskName,
                        codePoint: taskIcon.codePoint,
                        color: taskColor.value,
                        id: widget.taskId,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}

// Reason for wrapping fab with builder (to get scaffold context)
// https://stackoverflow.com/a/52123080/4934757
