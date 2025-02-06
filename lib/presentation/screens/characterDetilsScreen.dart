import 'package:flutter/material.dart';
import '../../constants/colosr.dart';
import '../../data/models/Chracters.dart';

class Characterdetilsscreen extends StatefulWidget {
  final CharacterModel character;

  const Characterdetilsscreen({super.key, required this.character});

  @override
  State<Characterdetilsscreen> createState() => _CharacterdetilsscreenState();
}

class _CharacterdetilsscreenState extends State<Characterdetilsscreen> {
  late ScrollController _scrollController;
  late bool isAppBarPinned;

  @override
  void initState() {
    super.initState();
    isAppBarPinned = false;
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (widget.character.id == 1) {
          
            isAppBarPinned = _scrollController.hasClients &&
                _scrollController.offset > 600 - kToolbarHeight;
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.character.name,
          style: TextStyle(
            color: widget.character.id == 1
                ? (isAppBarPinned ? Colors.white : myColors.myGrey)
                : Colors.white, // إذا كانت الشخصية ليست ID = 1 يبقى أبيض دائمًا
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: widget.character.id,
          child: Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double value) {
    return Divider(
      endIndent: value,
      color: myColors.myYelow,
      height: 35,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myGrey,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          buildSliverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Status: ", widget.character.status),
                      buildDivider(322),
                      characterInfo("Species: ", widget.character.species),
                      buildDivider(312),
                      characterInfo("Gender: ", widget.character.gender),
                      buildDivider(315),
                      characterInfo("Origin: ", widget.character.origin.name),
                      buildDivider(322),
                      characterInfo("Location: ", widget.character.location.name),
                      buildDivider(305),
                      characterInfo(
                        "Episodes: ",
                        widget.character.episode.length.toString(),
                      ),
                      buildDivider(300),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
