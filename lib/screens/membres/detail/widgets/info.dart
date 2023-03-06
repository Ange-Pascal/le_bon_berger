import 'package:flutter/material.dart';
import 'package:lebonberger/screens/membres/detail/widgets/description.dart';
import 'package:lebonberger/screens/membres/detail/widgets/gallery.dart';
import 'package:lebonberger/screens/membres/detail/widgets/review.dart';
import '../../home/widgets/header.dart';
import 'package:lebonberger/screens/membres/models/game.dart';


class GameInfo extends StatelessWidget {
  final Game game;

  const GameInfo(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HeaderSection(game),
          GallerySection(game),
          DescriptionSection(game),
          ReviewSection(game)
        ],
      ),
    );
  }
}
