import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_assets.dart';

const int _ordersCount = 30;
const int _vouchersCount = 10;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _buildStatItem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(name, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget _buildMenuTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    return ListTile(
      title: Text(title),
      leading: Icon(icon, size: isLandscape ? 24 : size.height * 0.03),
      onTap: () {},
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        size: isLandscape ? 24 : size.height * 0.03,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;

    final profileInfo = Column(
      children: [
        Container(
          height: size.height * 0.25,
          width: size.height * 0.25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppAssets.profilePhoto),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Mayar Hawary',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );

    final profileNumbers = isLandscape
        ? Column(
            children: [
              _buildStatItem(context, name: 'Orders', number: _ordersCount),
              const SizedBox(height: 16),
              _buildStatItem(context, name: 'Vouchers', number: _vouchersCount),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(context, name: 'Orders', number: _ordersCount),
              _buildStatItem(context, name: 'Vouchers', number: _vouchersCount),
            ],
          );

    final profileLists = Column(
      children: [
        const SizedBox(height: 20),
        const Divider(indent: 16, endIndent: 16),
        _buildMenuTile(
          context,
          title: 'Past Orders',
          icon: Icons.shopping_cart,
        ),
        const Divider(indent: 16, endIndent: 16),
        _buildMenuTile(
          context,
          title: 'Available Vouchers',
          icon: Icons.card_giftcard,
        ),
        const Divider(indent: 16, endIndent: 16),
      ],
    );

    return SingleChildScrollView(
      child: Center(
        child: isLandscape
            ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: profileInfo),
                      Expanded(child: profileNumbers),
                    ],
                  ),
                  profileLists,
                ],
              )
            : Column(
                children: [
                  profileInfo,
                  const SizedBox(height: 16),
                  profileNumbers,
                  profileLists,
                ],
              ),
      ),
    );
  }
}
