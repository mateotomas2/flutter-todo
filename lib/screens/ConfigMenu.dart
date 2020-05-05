import 'package:flutter/material.dart';
import 'package:fluttertodo/common/notifications.dart';
import 'package:fluttertodo/models/config/ConfigModel.dart';
import 'package:fluttertodo/widgets/form/TextFieldCustom.dart';

import 'package:provider/provider.dart';

class ConfigMenu extends StatefulWidget {
  static const routeName = '/config';

  ConfigMenu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ConfigMenuState createState() => _ConfigMenuState();
}

class _ConfigMenuState extends State<ConfigMenu> {
  TextEditingController controllerUserName = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeNotifications(context);
    loadConfig();
  }

  void loadConfig() async {
    final config = Provider.of<ConfigModel>(context, listen: false);
    controllerUserName.text = config.userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<ConfigModel>(builder: (context, config, child) {
        return TextFieldCustom(
            label: "Name:", controller: controllerUserName, onChanged: config.setUserName);
      }),
    );
  }
}
