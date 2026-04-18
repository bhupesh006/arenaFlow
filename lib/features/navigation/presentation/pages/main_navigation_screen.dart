import 'package:flutter/material.dart';

import 'package:arena_flow/core/theme/app_theme.dart';
import 'package:arena_flow/features/map_routing/presentation/pages/smart_map_page.dart';
import 'package:arena_flow/features/queue_tracker/presentation/pages/express_queue_page.dart';
import 'package:arena_flow/features/assistant/presentation/pages/arena_ai_assistant_page.dart';
import 'package:arena_flow/features/coordination_hub/presentation/widgets/coordination_banner.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    SmartMapPage(),
    ExpressQueuePage(),
    ArenaAiAssistantPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Coordination Hub - Always visible banner system
            const CoordinationBanner(),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Semantics(
        label: 'Main Navigation Bar',
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Semantics(
                label: 'Stadium Map Tab',
                child: const Icon(Icons.map_outlined),
              ),
              activeIcon: const Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Semantics(
                label: 'Food and Amenities Queue Tab',
                child: const Icon(Icons.fastfood_outlined),
              ),
              activeIcon: const Icon(Icons.fastfood),
              label: 'Express',
            ),
            BottomNavigationBarItem(
              icon: Semantics(
                label: 'AI Assistant Tab',
                child: const Icon(Icons.smart_toy_outlined),
              ),
              activeIcon: const Icon(Icons.smart_toy),
              label: 'Arena AI',
            ),
          ],
        ),
      ),
    );
  }
}
