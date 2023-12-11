import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(const Hub());
}

double logoWidth = 50;

class Hub extends StatelessWidget {
  const Hub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.grey,
        fontFamily: 'Roboto',
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
      home: const HubPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HubPage extends StatefulWidget {
  const HubPage({super.key, required this.title});

  final String title;

  @override
  State<HubPage> createState() => HubPageState();
}

class HubPageState extends State<HubPage> {
  Image logo = Image.asset(
    'images/GeddesWorksCutout.png',
    width: logoWidth,
  );

  Image logoMain = Image.asset(
    'images/GeddesWorksCutout.png',
    width: 70,
  );

  Image headshot = Image.asset(
    'images/headshot.jpg',
    width: 70,
    height: 70,
    fit: BoxFit.cover,
  );

  Image cultsLogo = Image.asset(
    'images/cults.png',
    width: logoWidth,
  );
  Image liInLogo = Image.asset(
    'images/linked.png',
    width: logoWidth,
  );
  Image githubLogo = Image.asset(
    'images/github-mark.png',
    width: logoWidth,
  );

  Image youtube = Image.asset(
    'images/yt.png',
    width: logoWidth,
  );
  Image printer = Image.asset(
    'images/3dPrinter.png',
    width: logoWidth,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: screenWidth > 300 ? 300 : screenWidth * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: headshot,
                    ),
                    logoMain,
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Collin Geddes",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[500],
                  fontFamily: 'Inconsolata',
                ),
              ),
              Text(
                "@GeddesWorks",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[500],
                  fontFamily: 'Inconsolata',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              button(
                logo,
                "Home Site",
                "https://www.geddesworks.com",
                screenWidth,
              ),
              button(
                printer,
                "3D Print Shop",
                "https://3dshop.geddesworks.com",
                screenWidth,
              ),
              button(
                youtube,
                "Youtube",
                "https://www.youtube.com/channel/UCl6UJ-zSBmVH_TGAgRP-gbw",
                screenWidth,
              ),
              button(
                cultsLogo,
                "Cults 3D",
                "https://cults3d.com/en/users/GeddesWorks/3d-models",
                screenWidth,
              ),
              button(
                liInLogo,
                "LinkedIn",
                "https://www.linkedin.com/in/collingeddes",
                screenWidth,
              ),
              button(
                githubLogo,
                "GitHub",
                "https://github.com/GeddesWorks",
                screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(Image logo, String text, String url, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600], // Set the background color

          borderRadius:
              BorderRadius.circular(25.0), // Optional: add border radius
        ),
        alignment: Alignment.center,
        width: screenWidth > 300 ? 300 : screenWidth * .9,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            js.context.callMethod('open', [url]);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                logo,
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
