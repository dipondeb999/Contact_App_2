import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> _allUsers = [
    {
      'title': 'Dipon Deb',
      'subtitle' : '2 minute',
    },
    {
      'title': 'Fokrul Islam',
      'subtitle' : '4 minute',
    },
    {
      'title': 'Tajida Akter Tayeba',
      'subtitle' : '6 minute',
    },
    {
      'title': 'Shayedur Rahman',
      'subtitle' : '8 minute',
    },
    {
      'title': 'Hasan Sajib',
      'subtitle' : '10 minute',
    },
    {
      'title': 'Kamrul Islam Sunny',
      'subtitle' : '12 minute',
    },
    {
      'title': 'Anisha Akter',
      'subtitle' : '14 minute',
    },
    {
      'title': 'Safia Akter',
      'subtitle' : '16 minute',
    },
    {
      'title': 'Aisy Rani Debi',
      'subtitle' : '18 minute',
    },
    {
      'title': 'Farjana Akter Jui',
      'subtitle' : '20 minute',
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword){
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user['title'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Contact',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                height: MediaQuery.of(context).size.height / 1.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(_foundUsers[index]['title']),
                        subtitle: Text(_foundUsers[index]['subtitle']),
                        leading: CircleAvatar(
                          child: Text('${_allUsers[index]['title'][0]}')
                        ),
                        trailing: const Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Add a new contact.'),
            backgroundColor: Colors.green,
          ));
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
    );
  }
}
