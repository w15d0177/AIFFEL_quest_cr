import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> textSections = [
    {"text": "\nI’m not going to lie,", "highlight": true},
    {
      "text":
          " I was pretty insulted to not be invited to my ex boyfriend’s wedding."
    },
    {"text": "\nIn all honesty,", "highlight": true},
    {"text": " I had every right to be there."},
    {"text": "\nIn my view,", "highlight": true},
    {
      "text":
          " I should’ve been invited so it was totally fair for me to turn up on the day."
    },
    {"text": "\nIf you ask me,", "highlight": true},
    {
      "text":
          " the church service was wonderful, but it was a shame I had to stand at the back."
    },
    {"text": "\nAs far as I can tell,", "highlight": true},
    {"text": " the bride wasn’t really expecting me."},
    {"text": "\nTo my mind,", "highlight": true},
    {"text": " she should’ve been happier to see me and receive my support."},
    {"text": "\nAs far as I’m concerned,", "highlight": true},
    {"text": " she totally overreacted and shouldn’t have cried."},
    {"text": "\nThe way I see things (it),", "highlight": true},
    {"text": " I made the family photographs a lot more interesting."},
    {"text": "\nAs I see things (it),", "highlight": true},
    {
      "text":
          " they obviously didn’t take me into consideration when drawing up the seating plans."
    },
    {"text": "\nIt seems to me that", "highlight": true},
    {"text": " everyone overreacted when I tried to sit at the top table."},
    {"text": "\nI believe that", "highlight": true},
    {"text": " they should have just made space for me in the first place."},
    {"text": "\nI’d say that", "highlight": true},
    {
      "text":
          " the food was very good, but it was a shame I had to share with my neighbour."
    },
    {"text": "\nI consider it to be", "highlight": true},
    {
      "text":
          " very rude that I was forced to sit down when I stood up to make a speech."
    },
    {"text": "\nTo me,", "highlight": true},
    {
      "text":
          " no one knows my ex better than me so I should’ve been able to tell all of our funny stories."
    },
    {"text": "\nFrom my point of view,", "highlight": true},
    {
      "text":
          " the first dance was cringe-worthy so I did everyone a favor by joining in."
    },
    {"text": "\nIt is my view (belief) that", "highlight": true},
    {"text": " the open bar made everything worse."},
    {"text": "\nI reckon", "highlight": true},
    {"text": " the sixth gin and tonic tipped me over the edge."},
    {"text": "\nI honestly believe that", "highlight": true},
    {"text": " if I hadn’t started cutting the cake, no one would have."},
    {"text": "\nHonestly speaking,", "highlight": true},
    {"text": " I probably shouldn’t have thrown my slice at the bride."},
    {"text": "\nI feel that", "highlight": true},
    {
      "text":
          " my ex could have found a more welcoming bride with a better sense of humor."
    },
    {"text": "\nPersonally speaking,", "highlight": true},
    {"text": " calling the police was a bit OTT."},
  ];

  final List<String> favorites = [];

  void toggleFavorite(String text) {
    setState(() {
      if (favorites.contains(text)) {
        favorites.remove(text);
      } else {
        favorites.add(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Do not say "I think"')),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: textSections.map((section) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (section["highlight"] ?? false)
                    IconButton(
                      icon: Icon(
                        favorites.contains(section["text"])
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.blue,
                      ),
                      onPressed: () => toggleFavorite(section["text"]),
                    ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: section["text"],
                        style: TextStyle(
                          fontSize: 18,
                          color: (section["highlight"] ?? false)
                              ? Colors.black
                              : Colors.black45,
                          fontWeight: (section["highlight"] ?? false)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key),
            label: 'Key Expression',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        onTap: (index) {
          if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FavoritesDetailScreen(favorites: favorites),
              ),
            );
          }
        },
      ),
    );
  }
}

class FavoritesDetailScreen extends StatelessWidget {
  final List<String> favorites;

  FavoritesDetailScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favorites')),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favorites.isEmpty
            ? Center(child: Text("No favorites added"))
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.star, color: Colors.blue),
                    title: Text(
                      favorites[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key),
            label: 'Key Expression',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        onTap: (index) {
          Navigator.pop(context); // 하단 바에서 Home으로 돌아가기
        },
      ),
    );
  }
}
