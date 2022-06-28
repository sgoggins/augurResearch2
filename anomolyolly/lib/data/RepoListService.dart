
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'Repo.dart';

// A function that converts a response body into a List<Photo>.
List<Repo> parseRepos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Repo>((json) => Repo.fromJson(json)).toList();
}

Future<List<Repo>> fetchRepos(http.Client client) async {
  final response =  await client.get(Uri.parse('http://augur.chaoss.io/api/unstable/repos'));

  // compute sends work to io thread
  return compute(parseRepos, response.body);
}