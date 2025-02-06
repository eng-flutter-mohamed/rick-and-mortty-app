// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rickapp/bussnesLogic/cubit/characers_state.dart';
import 'package:rickapp/presentation/widget/nowConnectedEnternetWidget.dart';

import '../../bussnesLogic/cubit/characers_cubit.dart';
import '../../constants/colosr.dart';
import '../../data/models/Chracters.dart';
import '../widget/CharacersItime.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharacterModel> allCharacters = [];
  late List<CharacterModel> filteredCharacters = [];
  bool isSearching = false; // حالة البحث
  TextEditingController searchController =
      TextEditingController(); // تحكم في النص

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context)
        .getAllCharacters(); // تم تصحيح التسمية هنا
  }

  void startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void cancelSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      filteredCharacters = allCharacters; // إعادة جميع الشخصيات
    });
  }

  void performSearch(String query) {
    setState(() {
      filteredCharacters = allCharacters
          .where((ch) => ch.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      title: isSearching
          ? TextField(
              cursorColor: myColors.myWhite,
              controller: searchController,
              onChanged: performSearch,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search characters...",
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            )
          : const Text("Characters", style: TextStyle(color: Colors.white)),
      backgroundColor: myColors.myYelow, // تم تصحيح التسمية هنا
      leading: isSearching
          ? IconButton(
              color: Colors.white,
              onPressed: () {
                cancelSearch();
              },
              icon: const Icon(Icons.arrow_back))
          : null,
      actions: isSearching
          ? [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    cancelSearch();
                  },
                  icon: const Icon(Icons.close))
            ]
          : [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    startSearch();
                  },
                  icon: const Icon(Icons.search))
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBarbuild(),
        backgroundColor: myColors.myGrey,
        appBar: buildAppBar(),
        body:  OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ){
           final bool connected = !connectivity.contains(ConnectivityResult.none);

          if (connected) {
            return buildBlocWidget();
          } else {
            return Noconnectedenternetwidget();
          }
        },
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
        ),
        // body: OfflineBuilder(connectivityBuilder: (
        //   BuildContext context,
        //   List<ConnectivityResult> connectivity,
        //   Widget child,
        // ) {
        //   final bool connected =
        //       !connectivity.contains(ConnectivityResult.none);
        //   if (connected) {
        //     return buildBlocWidget();
        //   } else {
        //     return Noconnectedenternetwidget();
        //   }
        // })
        );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      // تم تصحيح التسمية هنا
      builder: (context, state) {
        if (state is CharactersLoaded) {
          // تم تصحيح التسمية هنا
          allCharacters = state.characters; // تم تصحيح التسمية هنا
          if (!isSearching || searchController.text.isEmpty) {
            filteredCharacters = allCharacters;
          }
          return buildCharactersList();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: myColors.myYelow, // تم تصحيح التسمية هنا
            ),
          );
        }
      },
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      itemCount: filteredCharacters.length,
      itemBuilder: (context, index) {
        return CharacersItime(
          // تم تصحيح التسمية هنا
          character: filteredCharacters[index],
        );
      },
    );
  }

  Widget BottomNavigationBarbuild() {
    return BottomNavigationBar(
      currentIndex: 0, // لتحديد القسم الافتراضي
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/characters');
            break;
          case 1:
            Navigator.pushNamed(context, '/episodesScreen');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/locations');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Episodes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Locations',
        ),
      ],
    );
  }
}
