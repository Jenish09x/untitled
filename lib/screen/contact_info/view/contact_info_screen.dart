import 'package:flutter/cupertino.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      navigationBar:  CupertinoNavigationBar(
        leading: Row(
          children: [
            GestureDetector(onTap: () {
              Navigator.pop(context);
            },child: const Icon(CupertinoIcons.back)),
            const Text(
              "Contacts",
              style: TextStyle(color: CupertinoColors.activeBlue),
            )
          ],
        ),
        trailing: const Text(
          "Edit",
          style: TextStyle(color: CupertinoColors.activeBlue),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: CupertinoColors.inactiveGray),
                child: const Center(
                    child: Text(
                  "JA",
                  style: TextStyle(color: CupertinoColors.white, fontSize: 35),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "John Applessed",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  boxTile(
                      context, CupertinoIcons.ellipses_bubble_fill, "Message"),
                  boxTile(context, CupertinoIcons.phone_fill, "Call"),
                  boxTile(context, CupertinoIcons.mail_solid, "Mail"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boxTileLarge(context,"mobile",'(888) 555-5512'),
                      const SizedBox(height: 1,),
                      boxTileLarge(context,'home','(888) 555-1212'),
                      const SizedBox(height: 15,),
                      boxTileLarge(context,'work','John-Appleseed@mac.com'),
                      const SizedBox(height: 15,),
                      boxTileMax(context,'work','3494 Kuhl Avenue\nAtlanta GA 30303\nUSA'),
                      const SizedBox(height: 1,),
                      boxTileMax(context,'home','1234 Laurel Street\nAtlanta GA 30303\nUSA'),
                      const SizedBox(height: 15,),
                      boxTileLarge(context, "birthday", 'June 22,1980'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Container boxTileMax(BuildContext context,String text,String contactText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.sizeOf(context).width * 0.96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.white),
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              contactText,
            ),
          ],
        ),
      ),
    );
  }

  Container boxTileLarge(BuildContext context,String text,String contactText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.sizeOf(context).width * 0.96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.white),
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              contactText,
              style: const TextStyle(color: CupertinoColors.activeBlue),
            ),
          ],
        ),
      ),
    );
  }

  Container boxTile(BuildContext context, IconData icon, String textData) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.sizeOf(context).width * 0.30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(
            height: 5,
          ),
          Text(
            textData,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
