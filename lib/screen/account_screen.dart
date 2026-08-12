import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ACCOUNT
            _AccountGroup(
              children: [
                _AccountItem(
                  icon: Icons.person_outline,
                  title: "Personal Information",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.location_on_outlined,
                  title: "My Addresses",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.payment_outlined,
                  title: "Payment Methods",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.shopping_bag_outlined,
                  title: "My Orders",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// PREFERENCES
            const Text(
              "Preferences",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            _AccountGroup(
              children: [
                _AccountItem(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.language_outlined,
                  title: "Language",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// MENU
            const Text(
              "Menu",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            _AccountGroup(
              children: [
                _AccountItem(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.info_outline,
                  title: "About Sstore",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.description_outlined,
                  title: "Terms & Conditions",
                  onTap: () {},
                ),

                _AccountItem(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// LOGOUT
            _AccountGroup(
              children: [
                _AccountItem(
                  icon: Icons.logout,
                  title: "Logout",
                  iconColor: Colors.red,
                  titleColor: Colors.red,
                  showArrow: false,
                  onTap: () {
                    // TODO: Logout
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _AccountGroup extends StatelessWidget {
  final List<Widget> children;

  const _AccountGroup({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: const Color(0xffF8F8FC),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: children,
      ),
    );
  }
}
class _AccountItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  final Color? iconColor;
  final Color? titleColor;
  final bool showArrow;

  const _AccountItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.titleColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: SizedBox(
        height: 48,

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),

          child: Row(
            children: [

              Icon(
                icon,
                size: 18,
                color: iconColor ?? Colors.black87,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,

                  style: TextStyle(
                    fontSize: 12,
                    color:
                        titleColor ?? Colors.black,
                  ),
                ),
              ),

              if (showArrow)
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}