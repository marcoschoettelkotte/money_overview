import 'package:flutter/cupertino.dart';
import 'package:money_overview/widgets/appbar_widget.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';
import 'package:money_overview/widgets/transactions/transactions_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const AppBarWidget(),
          SliverList(
              delegate: SliverChildBuilderDelegate((_, int index) {
            return const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 10),
              child: TransactionsWidget(isReduced: false),
            );
          }, childCount: 1))
        ],
      ),
    ));
  }
}
