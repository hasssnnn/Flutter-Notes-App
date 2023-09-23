import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/custom_circle_avatar.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {
                    
                  });
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                },
                child: CustomCircleAvatar(
                    color: kColors[index], isSelected: currentIndex == index),
              ),
            );
          }),
    );
  }
}
