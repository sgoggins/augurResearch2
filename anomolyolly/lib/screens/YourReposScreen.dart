// repo list page

import 'package:flutter/material.dart';
import 'package:http/http.dart';


import '../data/Repo.dart';
import '../data/RepoListService.dart';
import '../widgets/MyWidgets.dart';

class YourReposScreen extends StatefulWidget {
  YourReposScreen({required this.savedRepos});
  final List<int>? savedRepos;

  @override
  _YourReposState createState() => _YourReposState(myRepos: savedRepos);
}

class _YourReposState extends State<YourReposScreen> {
  _YourReposState({required this.myRepos});
  late Future<List<Repo>> futureRepos;
  List<int>? myRepos;

  void initState() {
    super.initState();
    futureRepos = fetchRepos(Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidgets.getAppBar("YourRepos"),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("YourRepos",
                  style: Theme.of(context).textTheme.headline6,
                )),
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
                          return getRepositoryRow(snapshot.data![index], myRepos);
                        },
                        separatorBuilder: (BuildContext context, int index) => getRepositoryDivider(snapshot.data![index], myRepos),
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
          ]
      ),
    );
  }

  Widget getRepositoryDivider(Repo repo, List<int>? myRepos) {
    if(myRepos?.contains(repo.id) == true) {
      return Divider();
    } else {
      return Container();
    }
  }

  Widget getRepositoryRow(Repo repo, List<int>? myRepos) {
    if(myRepos?.contains(repo.id) == true) {
      return ListTile(
          title: Text(repo.name),
          subtitle: Text("Commits: ${repo.allTimeCommits?.toInt()} Issues: ${repo.allTimeIssues?.toInt()}"),
      );
    } else return Container();
  }


}
