import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _activeCounter = 84;
  bool _liveSync = true;
  double _sliderVal = 0.72;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Breathe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bolt, color: AppTheme.primaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryColor.withValues(alpha: 0.3), AppTheme.surfaceColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Breathe Score', style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      Switch(
                        value: _liveSync,
                        activeThumbColor: AppTheme.primaryColor,
                        onChanged: (v) => setState(() => _liveSync = v),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('$_activeCounter%', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: _sliderVal,
                    backgroundColor: Colors.white12,
                    color: AppTheme.primaryColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildMetricCard('Efficiency', '98.4%', Icons.speed)),
                const SizedBox(width: 12),
                Expanded(child: _buildMetricCard('Sessions', '1,420', Icons.analytics)),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Daily Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(3, (i) => Card(
              color: AppTheme.surfaceColor,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                  child: Icon(Icons.check_circle, color: AppTheme.primaryColor),
                ),
                title: Text('Breathe Milestone ${i + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Status: Complete • ${ (i + 1) * 24 }m logged'),
                trailing: const Icon(Icons.chevron_right, color: Colors.white38),
                onTap: () => setState(() => _activeCounter = (_activeCounter + 1) % 100),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String val, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.secondaryColor, size: 28),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 4),
          Text(val, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
