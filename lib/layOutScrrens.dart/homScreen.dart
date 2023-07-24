import 'package:flutter/material.dart';
import 'package:flutter_application_2/layOutScrrens.dart/app_cubit.dart/appcubit.dart';
import 'package:flutter_application_2/layOutScrrens.dart/cubit.dart/state.dart';
import 'package:flutter_application_2/layOutScrrens.dart/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart/appCubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(),
                          ));
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      appCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined))
              ],
              title: Text('News App'),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.BottomItem,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottonNav(index);
              },
            ));
      },
    );
  }
}
