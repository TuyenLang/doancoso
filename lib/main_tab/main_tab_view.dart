import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_lover/common/color_extension.dart';
import 'package:money_lover/main_pages/calendart.dart';
import 'package:money_lover/main_pages/pendding/pendding.dart';
import 'package:money_lover/main_pages/budget.dart';
import 'package:money_lover/main_pages/pendding/transactionList.dart';
import 'package:money_lover/main_pages/user_account.dart';
import '../common_widget/subcription_home_row.dart';
import '../home/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _currentPage = 0;
  Widget currentTabView = const HomeView();
  final List<Widget> pages = [
    HomeView(),
    TransactionList(),
    Budget(),
    UserAccount(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: pages[_currentPage],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/img/bottom_bar_bg.png",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentTabView = const HomeView();
                          });
                        },
                        icon: _IconButton(
                          index: 0,
                          iconPath: "assets/img/home.png",
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentTabView = const HomeView();
                          });
                        },
                        icon: _IconButton(
                          index: 1,
                          iconPath: "assets/img/budgets.png",
                        ),
                      ),
                      _addSpendingButton(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentTabView = const HomeView();
                          });
                        },
                        icon: _IconButton(
                          index: 2,
                          iconPath: "assets/img/calendar.png",
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentTabView = const HomeView();
                          });
                        },
                        icon: _IconButton(
                          index: 3,
                          iconPath: "assets/img/creditcards.png",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _IconButton({required int index, required String iconPath}) {
    return IconButton(
      onPressed: () {
        setState(() {
          _currentPage = index;
        });
      },
      icon: Image.asset(
        iconPath,
        width: 25,
        height: 25,
        color: _currentPage == index ? TColor.white : TColor.gray30,
      ),
    );
  }

  Widget _addSpendingButton() {
    return Positioned(
      bottom: 20,
      child: InkWell(
        onTap: () {
          // Hành động khi nhấn nút thêm chi tiêu
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TColor.secondary.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            "assets/img/center_btn.png",
            width: 55,
            height: 55,
          ),
        ),
      ),
    );
  }
}
