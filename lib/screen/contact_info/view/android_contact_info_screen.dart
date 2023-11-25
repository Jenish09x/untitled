import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screen/contact/provider/contact_provider.dart';

class AndroidContactInfo extends StatefulWidget {
  const AndroidContactInfo({super.key});

  @override
  State<AndroidContactInfo> createState() => _AndroidContactInfoState();
}
HomeProvider? providerR;
HomeProvider? providerW;

class _AndroidContactInfoState extends State<AndroidContactInfo> {
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            const Icon(Icons.star_border),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const CheckedPopupMenuItem(child: Text("hello"),)
              ];
            },),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const CircleAvatar(radius: 70,child: Text("JA",style: TextStyle(fontSize: 40),),),
              const SizedBox(height: 10,),
              const Text("John Applessed",style: TextStyle(fontSize: 25),),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonTile("Call",Icons.call_outlined,color: Colors.grey,),
                  buttonTile("Text",Icons.message_outlined,color: Colors.grey),
                  buttonTile("Video",Icons.video_call_outlined,color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                height: MediaQuery.sizeOf(context).height*0.45,
                width: MediaQuery.sizeOf(context).width*0.90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Contact info'),
                    const Row(
                      children: [
                        Icon(Icons.call_outlined),
                        SizedBox(width: 20,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("+91 1234-5678-911",style: TextStyle(fontSize: 16),),
                            Text("Mobile",style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        SizedBox(width: 145,),
                        Icon(Icons.message_outlined),
                      ],
                    ),
                    textTile("Message  +911234-5678-911","assets/img/img.png"),
                    textTile("Voice call  +911234-5678-911","assets/img/img.png"),
                    textTile("Video call  +911234-5678-911","assets/img/img.png"),
                    textTile("Message  +911234-5678-911","assets/img/img_1.png"),
                    textTile("Voice call  +911234-5678-911","assets/img/img_1.png"),
                    textTile("Video call  +911234-5678-911","assets/img/img_1.png"),
                    Row(
                      children: [
                        Text(
                          "Date ${providerW!.date!.day}/${providerW!.date!
                              .month}/${providerW!.date!.year}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () async {
                          DateTime? d1 = await showDatePicker(context: context,
                            initialDate: providerR!.date!,
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2025),
                          );
                          providerR!.changDate(d1!);
                        }, icon: const Icon(Icons.date_range),),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Time ${providerW!.time!.hour}:${providerW!.time!.minute}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () async {
                          TimeOfDay? d2 =  await showTimePicker(
                            context: context,
                            initialTime: providerR!.time!,
                          );
                          providerR!.changeTime(d2!);
                        }, icon: const Icon(Icons.watch_later_outlined),),
                      ],),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buttonTile(String text,IconData icon, {required MaterialColor color}) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: Colors.grey.shade200,radius: 25,child: Icon(icon),),
        const SizedBox(height: 10,),
        Text(text,style: const TextStyle(fontSize: 15),),
      ],
    );
  }

  Row textTile(String text,String img) {
    return Row(
      children: [
        Image(image: AssetImage(img),height: 26,),
        const SizedBox(width: 20,),
        Text(text,style: const TextStyle(fontSize: 16),),
      ],
    );
  }
}
