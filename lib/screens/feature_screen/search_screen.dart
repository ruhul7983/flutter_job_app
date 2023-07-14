import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  List<DocumentSnapshot> searchResults = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Container(
          height: mq.height * 0.05,
          width: mq.width * 0.8,
          child: Center(
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (_) {
                setState(() {
                  isSearching = true;
                });
                performSearch();
              },
              decoration: InputDecoration(
                hintText: 'Keyword',
                disabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFf5f6f8),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        centerTitle: true,
      ),
      body: isSearching
          ? FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('posts')
            .where('jobTitle', isGreaterThanOrEqualTo: searchController.text)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No results found."),
            );
          }
          searchResults = snapshot.data!.docs;
          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    searchResults[index]['jobTitle'],
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(searchResults[index]['companyLogo']),
                  ),
                ),
              );
            },
          );
        },
      )
          : Center(
        child: Text("Search job post"),
      ),
    );
  }

  void performSearch() {
    setState(() {
      searchResults = [];
    });
  }
}
