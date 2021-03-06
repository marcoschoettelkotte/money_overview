import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/pages/add/local_widgets/add_form.dart';
import 'package:money_overview/widgets/appbar_widget.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() async {
    // FocusScope.of(context).requestFocus(FocusNode());
    //FocusScope.of(context).unfocus();
    //
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        onLongPress: () => FocusScope.of(context).unfocus(),
        onHorizontalDragStart: (_) => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const AppBarWidget(),
            AddFormWidget(scrollController: _scrollController),
          ],
        ),
      ),
    ));
  }
}
