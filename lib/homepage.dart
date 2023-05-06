import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workforce/login_page.dart';
import 'package:workforce/materials.dart';

import 'moredetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String emailSp = prefs.getString('firstname') ?? '';
    setState(() => email = emailSp);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Materials> filteredMaterials = [];

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    startSearching(String search) {
      setState(() {
        filteredMaterials = materials
            .where((material) =>
                material.title.toLowerCase().contains(search.toLowerCase()))
            .toList();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Search for: $search'),
            content: SizedBox(
              height: 200,
              width: 100,
              child: ListView.builder(
                itemCount: filteredMaterials.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MoreDetails(filteredMaterials[index])));
                  },
                  leading: SvgPicture.asset(
                    'images/${filteredMaterials[index].img}.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: Text(filteredMaterials[index].title),
                  trailing: Text(
                    (filteredMaterials[index].count.toString()),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 103, 112, 80),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Home'),
              const Text('Order'),
              InkWell(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('firstname');
                  await prefs.remove('lastname');
                  await prefs.remove('email');
                  await prefs.remove('password');
                  await prefs.remove('rememberMe');
                  if (!mounted) return;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text('Log-out'),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back,',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: TextField(
                onSubmitted: (String value) => startSearching(value),
                controller: search,
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () => startSearching(search.text),
                    child: const Icon(Icons.search),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 194, 109, 219),
              ),
              height: 300,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView.builder(
                itemCount: materials.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MoreDetails(materials[index])));
                  },
                  leading: SvgPicture.asset(
                    'images/${materials[index].img}.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: Text(materials[index].title),
                  trailing: Text(
                    (materials[index].count),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 4),
              child: Text(
                'Workers near you',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/maps.png'),
            ),
          ],
        ),
      ),
    );
  }
}
