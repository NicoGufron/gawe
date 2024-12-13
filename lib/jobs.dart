import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gawe/components/custom_app_bar.dart';
import 'package:gawe/components/custom_drawer.dart';
import 'package:gawe/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Jobs extends StatefulHookConsumerWidget {
  const Jobs({super.key});

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends ConsumerState<Jobs> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.backgroundColor,
      appBar: AppBarUtil.drawerAppBar(
        context: context, 
        title: 'Gawean', 
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
        }
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Column(
          
        )
      ),
    );
  }
}

