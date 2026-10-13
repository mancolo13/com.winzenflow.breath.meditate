import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WinZenFlow • Log'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                  child: const Icon(Icons.person, size: 40, color: AppTheme.primaryColor),
                ),
                const SizedBox(height: 12),
                const Text('User #82914', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('Premium Status: Active', style: TextStyle(color: AppTheme.secondaryColor, fontSize: 13)),
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
                _buildActionItem(Icons.help_outline, 'Help & FAQ'),
                const Divider(),
                _buildActionItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                const Divider(),
                _buildActionItem(Icons.star_rate_outlined, 'Rate Application'),
                const Divider(),
                _buildActionItem(Icons.logout, 'Log Out'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => RoutingService.openRegistrationUrl(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('Check for Updates', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: () => RoutingService.openRegistrationUrl(),
    );
  }
}
