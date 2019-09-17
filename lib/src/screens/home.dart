import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/home_provider.dart';
import 'package:sample_todo/src/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(onScrollToBottom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerWidget(),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider homeProvider, _) {
          if (homeProvider.todos.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              homeProvider.reset();
              await homeProvider.fetchMoreTodo();
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: homeProvider.todos.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == homeProvider.todos.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Visibility(
                        visible: homeProvider.inFetching,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                return ListTile(
                  title: Text(homeProvider.todos[index].title),
                  trailing: Checkbox(
                    value: homeProvider.todos[index].completed,
                    onChanged: null,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void onScrollToBottom() {
    final HomeProvider homeProvider = Provider.of(context);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !homeProvider.isOutOfRange &&
        !homeProvider.inFetching) {
      homeProvider.fetchMoreTodo();
    }
  }
}
