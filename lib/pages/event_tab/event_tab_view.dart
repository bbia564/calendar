import 'package:event_calendar/pages/event_first/event_first_logic.dart';
import 'package:event_calendar/pages/event_first/event_first_view.dart';
import 'package:event_calendar/pages/event_second/event_second_view.dart';
import 'package:event_calendar/pages/event_third/event_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../event_second/event_second_logic.dart';
import 'event_tab_logic.dart';

class EventTabPage extends GetView<EventTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          EventFirstPage(),
          EventSecondPage(),
          EventThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navEventBars()),
    );
  }

  Widget _navEventBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          EventFirstLogic firstLogic = Get.put(EventFirstLogic());
          firstLogic.getData();
        } else if (index == 1) {
          EventSecondLogic secondLogic = Get.put(EventSecondLogic());
          secondLogic.getData();
        }
      },
    );
  }
}
