import 'dart:convert';
import 'dart:async'; // To use Stream.periodic
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/widgets/task_tile.dart';
import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Function to fetch tasks from the Go backend
  Future<List<Map<String, String>>> fetchTasks() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/tasks'));

    if (response.statusCode == 200) {
      final List<dynamic> tasks = json.decode(response.body);
      return tasks
          .map((task) => {
                'title': task['title'].toString(),
                'subtitle': task['subtitle'].toString(),
                'description': task['description'].toString(),
              })
          .toList();
    } else {
      throw Exception('Failed to fetch tasks: ${response.statusCode}');
    }
  }

  // Function that provides a stream of tasks that refreshes periodically
  Stream<List<Map<String, String>>> getTaskStream() async* {
    while (true) {
      // Fetch tasks every 10 seconds
      yield await fetchTasks();
      await Future.delayed(const Duration(seconds: 10)); // Update interval
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: LightThemeColors.appBarColor,
        title: Text(
          'Taskero',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
            color: LightThemeColors.textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'add_tasks');
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: LightThemeColors.primaryColor,
                )),
          )
        ],
      ),
      body: StreamBuilder<List<Map<String, String>>>(
        stream: getTaskStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: LightThemeColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks available.'));
          } else {
            final data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ViewTaskTile(
                    title: item['title'] ?? 'Untitled',
                    subtitle: item['subtitle'] ?? 'No subtitle',
                    description: item['description'] ?? 'No description',
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
