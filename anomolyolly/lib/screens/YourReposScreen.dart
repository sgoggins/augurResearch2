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
                    List<Widget>? repositoryRows;
                    if (snapshot.hasData) {
                      repositoryRows = getRepositoryRows(snapshot.data);
                    }
                    if (repositoryRows != null) {
                      return ListView(children: repositoryRows);
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

  List<Widget>? getRepositoryRows(List<Repo>? repos) {
    return repos?.map((repo) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage("https://helloartsy.com/wp-content/uploads/kids/marine_life/octopus_cartoon_drawing/octopus-cartoon-drawing_step-6.jpg")
        ),
        title: Text(repo.name),
        subtitle: Text("Commits: ${repo.allTimeCommits?.toInt()} Issues: ${repo.allTimeIssues?.toInt()}"),
      );
    }).toList();

  }
}