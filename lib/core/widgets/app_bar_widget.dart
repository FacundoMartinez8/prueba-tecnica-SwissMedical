import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import '../services/dependencies_injection_service.dart';
import '../use_case/no_params.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  final double appBarHeight;

  AppBarWidget({
    super.key,
    required this.appBarHeight,
    required this.index,
  });

  final homePageBloc = getIt<HomePageBloc>();

  static String getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Mas populares';
      case 1:
        return 'Mejor valoradas';
      case 2:
        return 'Proximamente';
      default:
        return '';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return AppBar(
          title: GestureDetector(
            onTap: () {
              homePageBloc.add(GetPopularMovieEvent(noParams: NoParams()));
            },
            child: Text(getTitleForIndex(index),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.black87,
        );
      },
    );
  }
}
