import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_app/resources/firestore_method.dart';
import 'package:job_app/screens/bottom_nav/categories_show/full_time.dart';
import 'package:job_app/screens/bottom_nav/categories_show/part_time.dart';
import 'package:job_app/screens/bottom_nav/categories_show/remote_post.dart';
import 'package:job_app/screens/feature_screen/details_job_post.dart';
import 'package:job_app/screens/feature_screen/search_screen.dart';
import 'package:job_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../model/user.dart';
import '../../provider/user_provider.dart';
import '../../widgets/job_post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addData();
    });
    getRemoteData();
    getFullData();
    getPartData();
    super.initState();
  }
  addData() async {
    UserProvider _userProvider = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }
  String dataRemote = '';
  String dataFull = '';
  String dataPart = '';
  void getRemoteData() async {
    String partLen = await FireStoreMethod().getRemoteLen();
    setState(() {
      dataRemote = partLen;
    });
  }
  void getFullData() async {
    String remoteLen = await FireStoreMethod().getFullLen();
    setState(() {
      dataFull = remoteLen;
    });
  }
  void getPartData() async {
    String partLen = await FireStoreMethod().getPartLen();
    setState(() {
      dataPart = partLen;
    });
  }


  @override
  Widget build(BuildContext context) {
    final UserClass user = Provider.of<UserProvider>(context).getUser;

   return Scaffold(
      backgroundColor: Color(0xFFf5f6f8),
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.image),
          ),
        ),
        title: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchScreen()));
          },
          child: Container(
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
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),maxLines: 1,overflow: TextOverflow.fade,
                  ),
                ],
              ),
              SizedBox(height: mq.height * 0.02),
              Container(
                height: mq.height * 0.18,
                child: Image.asset(
                  "assets/banner2.jpg",
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
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Remote()));
                    },
                    child: Container(
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
                          Text(dataRemote,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>FullTime()));
                          },
                          child: Container(
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
                                  dataFull,
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
                        ),
                        SizedBox(height: mq.height * 0.01),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>PartTime()));
                          },
                          child: Container(
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
                                  dataPart,
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
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('posts').where('isPending',isEqualTo: 'no').snapshots(),
                builder: (context, snapshot) {
                  final List<DocumentSnapshot>? documents = snapshot.data?.docs;
                  final int itemCount = documents?.length ?? 0;
                  final int displayedItemCount = itemCount <= 10 ? itemCount : 10;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.antiAlias,
                    itemCount: displayedItemCount,
                    itemBuilder: (context, index) {
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsJobPost(snap: snapshot.data!.docs[index] as dynamic,)));
                          },
                          child: JobPostCard(snap: snapshot.data!.docs[index] as dynamic,));
                    },);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
