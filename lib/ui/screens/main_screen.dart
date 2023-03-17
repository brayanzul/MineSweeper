import 'package:flutter/material.dart';
import 'package:minesweeper/ui/theme/colors.dart';
import 'package:minesweeper/utilis/game_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MineSweeperGame game = MineSweeperGame();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.generateMap();
  }

  @override
  Widget build(BuildContext context) {
    // Let's store the colors in a seperate file
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text("MineSweeper"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.flag,
                        color: AppColor.accentColor,
                        size: 34.0,
                      ),
                      const Text(
                        "10",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.timer,
                        color: AppColor.accentColor,
                        size: 34.0,
                      ),
                      const Text(
                        "10:32",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          /* Now let's add the Game Grid */
          Container(
            width: double.infinity,
            height: 500.0,
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MineSweeperGame.row,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ), 
              itemBuilder: (BuildContext ctx, index) {
                Color cellColor = game.gameMap[index].reveal ? AppColor.clickedCard : AppColor.lightPrimaryColor;
                return GestureDetector(
                  onTap: game.gameOver
                    ? null
                    : () {
                      setState(() {
                        game.getClickedCell(game.gameMap[index]);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cellColor,
                      ),
                    ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
