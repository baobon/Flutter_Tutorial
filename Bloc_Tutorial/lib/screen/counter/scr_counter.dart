import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/counterapp/counter_bloc.dart';
import 'package:new_app/bloc/counterapp/counter_event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Scaffold(
          appBar: AppBar(title: Text('Counter')),
          body: Center(
            child: Text(
              '${count}',
              // "11",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    // counterBloc.add(CounterEvent.up);
                    BlocProvider.of<CounterBloc>(context).add(CounterEvent.up);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    // counterBloc.add(CounterEvent.down);
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterEvent.down);
                  },
                ),
              ),
            ],
          ),
        );
        // });
      }),
    );
  }
}
