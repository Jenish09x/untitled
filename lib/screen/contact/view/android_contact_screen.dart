import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/contact_list.dart';

class AndroidContactScreen extends StatefulWidget {
  const AndroidContactScreen({super.key});

  @override
  State<AndroidContactScreen> createState() => _AndroidContactScreenState();
}

class _AndroidContactScreenState extends State<AndroidContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 420,
                  child: SearchBar(
                    elevation: const MaterialStatePropertyAll(1),
                    hintText: "Search contacts",
                    shadowColor: const MaterialStatePropertyAll(Colors.white),
                    leading: const Icon(Icons.menu),
                    trailing: [
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              child: Text(
                                "Setting",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "Date",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "More",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ];
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        child: Text("J"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      actionChipTile("Phone contacts"),
                      actionChipTile("Email contacts"),
                      actionChipTile("Company contacts"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_2,
                      size: 22,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("All accounts ,987 contacts"),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index) => SizedBox(
                      height: 60,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "androidContactInfo");
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Text(contactList[index]
                                  .toString()
                                  .substring(0, 1)
                                  .toUpperCase()),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${contactList[index]}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.green,
          onPressed: () {
            ShowModalBottomSheet(context);
          },
          child: const Icon(Icons.dialpad),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_outline),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> ShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => SizedBox(
          height: 200,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {},
                child: const Text("yes"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("No"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ActionChip actionChipTile(String text) => ActionChip(
      side: const BorderSide(color: Colors.grey, width: 1),
      labelPadding: const EdgeInsets.all(2),
      label: Text(text),
    );
