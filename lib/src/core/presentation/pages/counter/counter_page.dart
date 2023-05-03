import 'package:flutter/material.dart';

import '../../view_models/pages/counter_page_view_model.dart';

class CounterPage extends StatelessWidget {
  final CounterPageViewModel viewModel;

  const CounterPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: viewModel.store,
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    value.text,
                  ),
                  Text(
                    value.counterViewModel.counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.store.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
