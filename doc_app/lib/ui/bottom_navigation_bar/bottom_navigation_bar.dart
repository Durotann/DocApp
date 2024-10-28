import 'package:auto_route/auto_route.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
        routes: const [
          MainRoute(),
          MainRoute(),
          MainRoute(),
        ],
        builder: (context, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  elevation: 1,
                  onTap: changeTab,
                  selectedItemColor:
                      theme.bottomNavigationBarTheme.selectedItemColor,
                  currentIndex: currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            currentIndex == 0 ? Colors.blue : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            "images/home1.png",
                            scale: 4,
                          ),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            currentIndex == 1 ? Colors.blue : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset('images/connect.png', scale: 4),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            currentIndex == 2 ? Colors.blue : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          child:
                              Image.asset('images/notification.png', scale: 4),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            currentIndex == 3 ? Colors.blue : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset('images/extension.png', scale: 4),
                        ),
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void changeTab(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
    switch (index) {
      case 0:
        // context.pushRoute('');
        break;
      case 1:
        // context.goNamed('orders', pathParameters: {
        //   "tabIndex": "new",
        // });
        break;
      default:
        // context.go('/profile');
        break;
    }
  }
}
