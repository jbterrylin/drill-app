import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ScrollableListView<T> extends StatefulWidget {
  const ScrollableListView(
      {super.key,
      required this.height,
      required this.getList,
      required this.getListErrLog,
      required this.scrollDirection,
      required this.itemBuilder,
      required this.itemPadding});

  final double height; // 水平列表高度

  final Future<List<T>> Function(int page) getList;

  final String getListErrLog;

  final Axis scrollDirection;

  final Widget Function(BuildContext context, T item, int index)
      itemBuilder; // 用于构建每个项的函数

  final EdgeInsets Function(T item, int index, int length) itemPadding; // 左右边距

  @override
  State<ScrollableListView<T>> createState() => ScrollableListViewState<T>();
}

class ScrollableListViewState<T> extends State<ScrollableListView<T>> {
  final log = Logger('ScrollableListView');

  bool isLoading = false;
  bool isEnd = false;
  int page = 1;
  final List<T> list = [];

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future<void> getList({bool reset = false}) async {
    if (reset) {
      // 优先处理重置逻辑
      setState(() {
        list.clear(); // 清空列表
        page = 1; // 重置页码
        isEnd = false; // 重置为未到结尾状态
      });
    } else if (isLoading || isEnd) {
      // 如果不是重置，检查是否正在加载或已经加载到底
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final newData = await widget.getList(page);

      setState(() {
        list.addAll(newData);
        isLoading = false;
        if (newData.isEmpty) {
          isEnd = true;
        }
        page += 1;
      });
    } catch (e) {
      log.severe(widget.getListErrLog, e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent) {
            getList();
          }
          return true;
        },
        child: ListView.builder(
          scrollDirection: widget.scrollDirection,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: widget.itemPadding(list[index], index, list.length),
            child: widget.itemBuilder(context, list[index], index),
          ),
        ),
      ),
    );
  }
}
