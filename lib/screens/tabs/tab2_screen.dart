import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  int _selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Relax'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_rounded, color: AppTheme.secondaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterChip('All', 0),
                _buildFilterChip('Active', 1),
                _buildFilterChip('Popular', 2),
                _buildFilterChip('Archived', 3),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (idx) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('${idx + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppTheme.primaryColor)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Relax Item #${idx + 101}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text('Category: Tier ${idx + 1} • Updated 2h ago', style: const TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => RoutingService.openRegistrationUrl(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('View'),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int i) {
    final active = _selectedIdx == i;
    return GestureDetector(
      onTap: () => setState(() => _selectedIdx = i),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppTheme.primaryColor : Colors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.white70, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}
