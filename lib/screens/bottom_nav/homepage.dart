import 'package:flutter/material.dart';
import 'package:job_app/utils/colors.dart';

import '../../main.dart';
import '../../widgets/job_post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFf5f6f8),
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
          ),
        ),
        title: Container(
          height: mq.height * 0.05,
          width: mq.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Search job",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(Icons.search,size: 17,),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFFf5f6f8),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hello, ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Md Ruhul Amin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: mq.height * 0.02),
              Container(
                height: mq.height * 0.18,
                child: Image.asset(
                  "assets/banner.jpg",
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: mq.height * 0.028),
              Text(
                "Find your job",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mq.height * 0.028),
              Row(
                children: [
                  Container(
                    height: mq.height * 0.28,
                    width: mq.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0xFFafecfe),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/remotejob.png",
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "45.5",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Remote jobs",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: mq.height * 0.14,
                          width: mq.width * 0.45,
                          decoration: BoxDecoration(
                            color: Color(0xFFbeb0ff),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "45.5",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Full Time",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: mq.height * 0.01),
                        Container(
                          height: mq.height * 0.14,
                          width: mq.width * 0.45,
                          decoration: BoxDecoration(
                            color: Color(0xFFffd6ae),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "45.5",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Part Time",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: mq.height * 0.03),
              Text(
                "Recent Job List",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mq.height * 0.03),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                clipBehavior: Clip.antiAlias,
                itemCount: 10,
                itemBuilder: (context, index) {
                return JobPostCard();
              },)
            ],
          ),
        ),
      ),
    );
  }
}
