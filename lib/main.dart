import 'package:bloc_app_1/app_blocs.dart';
import 'package:bloc_app_1/app_events.dart';
import 'package:bloc_app_1/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBlocs(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: BlocBuilder<AppBlocs, AppStates>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(state.counter.toString()),
                  const SizedBox(
                    height: 50,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<AppBlocs>().add(Increment());
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<AppBlocs>().add(Decrement());
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
