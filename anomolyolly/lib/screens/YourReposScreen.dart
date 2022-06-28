// repo list page
import 'package:anomolyolly/data/Repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../data/RepoListService.dart';

class YourReposScreen extends StatefulWidget {

  late Future<List<Repo>> futureRepos;

  @override
  _YourReposState createState() => _YourReposState();

}

class _YourReposState extends State<YourReposScreen> {
  late Future<List<Repo>> futureRepos;
  String searchString = "";

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos(Client());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Repo>>(
                  future: futureRepos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return getRepositoryRow(snapshot.data![index]);
                        },
                        separatorBuilder: (BuildContext context, int index) => getRepositoryDivider(snapshot.data![index]),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  }
              ),
            )

          ]
      ),
    );
  }

  Widget getRepositoryDivider(Repo repo) {
    if (repo.name.toLowerCase().contains(searchString)) {
      return Divider();
    } else {
      return Container();
    }
  }

  Widget getRepositoryRow(Repo repo) {
    if(repo.name.toLowerCase().contains(searchString)) {
      return ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage("https://helloartsy.com/wp-content/uploads/kids/marine_life/octopus_cartoon_drawing/octopus-cartoon-drawing_step-6.jpg")
        ),
        title: Text(repo.name),
        subtitle: Text("Commits: ${repo.allTimeCommits?.toInt()} Issues: ${repo.allTimeIssues?.toInt()}"),
      );
    } else return Container();
  }
}