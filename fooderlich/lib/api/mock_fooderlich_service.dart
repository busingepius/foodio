import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

import '../models/models.dart';

class MockFooderlichService {
  // Batch request that gets both recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreData(friendPosts, todayRecipes);
  }

  // Get sample explore recipes json to display in ui
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    try {
      // load json from file system
      final String dataString =
          await _loadAsset("assets/sample_data/sample_explore_recipes.json");

      final http.Response response = http.Response(dataString, 200);
      if (response.statusCode != 200) {
        throw Exception("failed to get data");
      }

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['recipes'] != null) {
        return json['recipes']
            .map<ExploreRecipe>((v) => ExploreRecipe.fromJson(v))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  // Get the sample friend json posts to display in ui

  Future<List<Post>> _getFriendFeed() async {
    try {
      // Load json from file system
      final String dataString =
          await _loadAsset('assets/sample_data/sample_friends_feed.json');
      // create the http.response with success

      final http.Response response = http.Response(dataString, 200);
      if (response.statusCode != 200) {
        throw Exception("failed to get friends feeds. No data obtained");
      }
      final Map<String, dynamic> json = jsonDecode(response.body);

      // Go through each post and convert json to Post object.
      if (json['feed'] != null) {
        return json['feed'].map<Post>((v) => Post.fromJson(v)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("failed to get friends feeds");
    }
  }

// Get the sample recipe json to display in ui
  Future<List<SimpleRecipe>> getRecipes() async {
    try {
      final dataString =
          await _loadAsset('assets/sample_data/sample_recipes.json');

      final http.Response response = http.Response(dataString, 200);

      if (response.statusCode != 200) {
        throw Exception('No data received');
      }

      final json = jsonDecode(response.body);

      return json.map<SimpleRecipe>((v) => SimpleRecipe.fromJson(v)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

// Loads sample json data from file system
Future<String> _loadAsset(String path) async {
  return rootBundle.loadString(path);
}
