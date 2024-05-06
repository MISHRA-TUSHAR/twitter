import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_flutter/features/community/ui/coummunity.dart';
import 'package:twitter_flutter/features/home/ui/home.dart';
import 'package:twitter_flutter/features/main_page/bloc/main_bloc.dart';
import 'package:twitter_flutter/features/messages/ui/messages.dart';
import 'package:twitter_flutter/features/notification/ui/notfication.dart';
import 'package:twitter_flutter/features/search/ui/search.dart';
import 'package:twitter_flutter/widgets/bottom.dart';
import 'package:twitter_flutter/widgets/main_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = MainBloc();
    final PageController pageController = PageController();
    return Scaffold(
      bottomNavigationBar: MainBottomNavBar(
        mainBloc: mainBloc,
        pageController: pageController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 33,
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: MainAppBar(),
            ),
          ),
          SliverFillRemaining(
            child: BlocConsumer<MainBloc, MainState>(
              bloc: mainBloc,
              listener: (context, state) {
                switch (state.runtimeType) {
                  case HomeClickedState:
                    pageController.jumpToPage(0);
                    break;
                  case SearchClickedState:
                    pageController.jumpToPage(1);
                    break;
                  case CommunitiesClickedState:
                    pageController.jumpToPage(2);
                    break;
                  case NotificationClickedState:
                    pageController.jumpToPage(3);
                    break;
                  case MessagesClickedState:
                    pageController.jumpToPage(4);
                    break;
                }
              },
              builder: (context, state) {
                return PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    HomePage(),
                    SearchPage(),
                    CommunitiesPage(),
                    NotificationsPage(),
                    MessagePage(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
