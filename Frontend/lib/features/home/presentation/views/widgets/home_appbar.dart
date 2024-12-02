import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const CircleAvatar(
            minRadius: 25,
            backgroundImage: AssetImage(MyAssets.otpImg),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: Styles.textStyle14
                    .copyWith(color: const Color.fromRGBO(255, 255, 255, 0.7)),
              ),
              Text(
                name,
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: 34,
              ))
        ],
      ),
    );
  }
}
