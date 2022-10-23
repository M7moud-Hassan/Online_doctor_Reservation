import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/widgets/assestant_widgets.dart';
import 'package:online_doctor_reservation/core/widgets/logo_widget.dart';

Widget postWidget(post) => Card(
      child: Column(
        children: [
          Row(
            children: [
              btnDeletePost,
              moreOptions,
              Expanded(child: namePublisher),
              logoWidget
            ],
          ),
          separator(heigh: 10),
          Text(post),
        ],
      ),
    );

Widget btnDeletePost =
    IconButton(onPressed: () {}, icon: const Icon(Icons.dangerous_outlined));

Widget moreOptions = IconButton(onPressed: () {}, icon: const Icon(Icons.more));

Widget namePublisher = const Text(
  "mahmoud hassan ahmed",
  textAlign: TextAlign.right,
);
