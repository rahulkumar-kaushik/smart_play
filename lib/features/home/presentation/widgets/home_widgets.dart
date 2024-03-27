part of 'package:just_play/features/home/presentation/pages/screens/home_page.dart';

menuItem(IconData icon, String title) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.blue,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(title)
    ],
  );
}

topMenu() {
  return Card(
    semanticContainer: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    surfaceTintColor: Colors.blue,
    margin: const EdgeInsets.all(14),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/reward_bg.png"),
            fit: BoxFit.fill,
            scale: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Play Games\nCollect Points\nCashout every 4 hours",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            iconColor: Colors.white,
            surfaceTintColor: Colors.white,
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: menuItem(Icons.star, "Rewards")),
                PopupMenuItem(child: menuItem(Icons.help, "F.A.Q")),
                PopupMenuItem(
                    child: menuItem(Icons.privacy_tip, "Privacy Policy")),
                PopupMenuItem(child: menuItem(Icons.group, "Tell a Friend")),
                PopupMenuItem(child: menuItem(Icons.email, "Help")),
              ];
            },
          ),
        ],
      ),
    ),
  );
}
