import 'package:flutter/material.dart';
import 'package:kortoba/view/Favourite/widgets/build_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../components/build_app_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,AppLocalizations.of(context)!.saves),
      body: const BuildBody(),
    );
  }
}
