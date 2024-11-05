import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.movie_creation_outlined,
            color: Colors.black,
          ),
          label: 'Mas populares',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star_border_outlined,
            color: Colors.black,
          ),
          label: 'Mejor valoradas',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.upcoming_outlined,
            color: Colors.black,
          ),
          label: 'Proximamente',
        ),
      ],
    );
  }
}
