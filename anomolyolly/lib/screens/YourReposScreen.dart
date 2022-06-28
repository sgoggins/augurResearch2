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

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos(Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<Repo>>(
          future: futureRepos,
          builder: (context, snapshot) {
            List<Widget>? repositoryRows;
            if(snapshot.hasData) {
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
        ),
    );
  }

  List<Widget>? getRepositoryRows(List<Repo>? repos) {
    return repos?.map((repo) {
      return Text(repo.name);
    }).toList();

  }
}