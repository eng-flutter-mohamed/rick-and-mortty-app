// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rickapp/constants/strings.dart';

import '../../constants/colosr.dart';
import '../../data/models/Chracters.dart';
class CharacersItime extends StatelessWidget {
  final CharacterModel character;

  const CharacersItime({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: myColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: 
      InkWell(
        onTap: () => Navigator.pushNamed(context, characterdetilisScreen, arguments:character ),
        child: GridTile(
        
          footer: Hero(
            tag: character.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.3,
                    color: myColors.myWhite),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "assets/loding.gif",
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/testImage"),
          ),
        ),
      ),
    );
  }
}
