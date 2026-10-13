import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  double _volume = 0.65;
  bool _notifs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WinZenFlow • Timer'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Timer Configuration', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Live Notifications', style: TextStyle(fontSize: 15)),
                    Switch(
                      value: _notifs,
                      activeThumbColor: AppTheme.secondaryColor,
                      onChanged: (v) => setState(() => _notifs = v),
                    ),
                  ],
                ),
                const Divider(height: 24),
                const Text('Sensitivity Level', style: TextStyle(fontSize: 15)),
                Slider(
                  value: _volume,
                  activeColor: AppTheme.secondaryColor,
                  onChanged: (v) => setState(() => _volume = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildSettingTile(Icons.tune, 'Advanced Parameters', 'Fine-tune engine presets'),
                const Divider(),
                _buildSettingTile(Icons.cloud_sync, 'Cloud Auto-Backup', 'Last synced today at 14:20'),
                const Divider(),
                _buildSettingTile(Icons.lock_clock, 'Security Interval', '15 min session timeout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppTheme.secondaryColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.white60)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white38),
      onTap: () => RoutingService.openRegistrationUrl(),
    );
  }
}
