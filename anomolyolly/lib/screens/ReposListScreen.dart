// repo list page
import 'package:flutter/material.dart';

import '../data/Repo.dart';
import 'package:http/http.dart';
import 'package:anomolyolly/data/Repo.dart';

import '../data/RepoListService.dart';

class ReposListScreen extends StatefulWidget {
  late Future<List<Repo>> futureRepos;

  @override
  _ReposListState createState() => _ReposListState();
}

class _ReposListState extends State<ReposListScreen> {
  late Future<List<Repo>> futureRepos;
  List<int> selectedRepos = List.empty(growable: true);
  String searchString = "";

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos(Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repos List")
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Select the repos you'd like to be notified about",
                  style: Theme.of(context).textTheme.headline6,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    return const Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        )
                    );
                  }
              ),
            ),
            getSaveButtonIfReposSelected()
          ]
      ),
    );
  }

  Widget getSaveButtonIfReposSelected() {
    if (selectedRepos.isEmpty) {
      return Container();
    } else {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                primary: Colors.white,
                backgroundColor: Color(0xff9799BA),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/notification');
              },
              child: Text("SAVE")));
    }
  }

  Widget getRepositoryDivider(Repo repo) {
    if (repo.name.toLowerCase().contains(searchString)) {
      return Divider();
    } else {
      return Container();
    }
  }

  void _updateSelected(int repoId) {
    setState(() {
      if (selectedRepos.contains(repoId)) {
        selectedRepos.remove(repoId);
      } else {
        selectedRepos.add(repoId);
      }
    });
  }

  Widget getRepositoryRow(Repo repo) {
    if(repo.name.toLowerCase().contains(searchString)) {
      return ListTile(
        leading: CircleAvatar(
            backgroundImage: getBackgroundImage(repo.id)
        ),
        title: Text(repo.name),
        subtitle: Text("Commits: ${repo.allTimeCommits?.toInt()} Issues: ${repo.allTimeIssues?.toInt()}"),
        onTap: () {
          _updateSelected(repo.id);
        }
      );
    } else return Container();
  }

  ImageProvider getBackgroundImage(int repoId) {
    if(!selectedRepos.contains(repoId)) {
      return AssetImage('assets/ic_olly.jpg');
    } else {
      return AssetImage('assets/ic_check.jpeg');
    }
  }
}