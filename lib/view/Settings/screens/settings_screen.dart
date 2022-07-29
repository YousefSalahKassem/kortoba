import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/view/Settings/widgets/build_body.dart';
import '../../../components/build_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,AppLocalizations.of(context)!.settings),
      body: const BuildBody(),
    );
  }
}
