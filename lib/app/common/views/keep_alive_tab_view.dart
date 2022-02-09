import 'package:flutter/material.dart';

class KeepAliveTabView extends StatefulWidget {
  final Widget child;
  const KeepAliveTabView(this.child, {Key? key}) : super(key: key);

  @override
  _KeepAliveTabViewState createState() => _KeepAliveTabViewState();
}

class _KeepAliveTabViewState extends State<KeepAliveTabView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
