import 'dart:ffi';

class Repo {
  final int id;
  final String name;
  final String? description;
  final String url;
  final String? status;
  final double? allTimeCommits;
  final double? allTimeIssues;
  final String? groupName;
  final int? groupId;

  const Repo({
    required this.id,
    required this.name,
    this.description,
    required this.url,
    this.status,
    this.allTimeCommits,
    this.allTimeIssues,
    this.groupName,
    this.groupId,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json['repo_id'] as int,
      name: json['repo_name'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      status: json['repo_status'] as String?,
      allTimeCommits: json['commits_all_time'] as double?,
      allTimeIssues: json['issues_all_time'] as double?,
      groupName: json['rg_name'] as String?,
      groupId: json['repo_group_id'] as int?
    );
  }
}