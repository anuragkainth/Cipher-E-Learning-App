import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cipher_schools/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:cipher_schools/utilities/bottom_floating_button.dart';
import 'package:cipher_schools/utilities/copyright_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void dispose() {
    // Re-enable landscape orientation when the page is disposed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  int _currentImageIndex = 0;
  int _currentImageIndex2 = 0;

  @override
  Widget build(BuildContext context) {

    // Disable landscape orientation for this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              kCipherSchoolsIcon,
              scale: 8,
            ), // Replace with company icon
            SizedBox(width: 10),
            Text(
              'CipherSchools',
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                )
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),

            // main heading text

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Welcome to',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' the Future',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(color: kDefaultOrangeColor, fontWeight: FontWeight.bold, fontSize: 42),
                    ),
                  ),
                  TextSpan(
                    text: ' of Learning!',
                    style:  GoogleFonts.openSans(
                      textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 42),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Sub heading text

            Text(
              'Start Learning by best creators for',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                textStyle:  TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
                ),
              ),
            ),

            // absolutely free type writter text
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                textStyle:  TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: kDefaultOrangeColor
                ),
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText('absolutely Free'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // start learning now button

            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Card(
                  color: kDefaultOrangeColor,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start Learning Now ',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ),
                          Icon(
                            Icons.east,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Courses infinite Slider

            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: kSliderImagesCourses.length,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  initialPage: _currentImageIndex,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Center(
                        child: Image.asset(
                          kSliderImagesCourses[index],
                          height: (index == _currentImageIndex)
                              ? MediaQuery.of(context).size.height * 2 / 3
                              : MediaQuery.of(context).size.height * 3 / 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // STATISTICS GRID VIEW

            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                controller: ScrollController(keepScrollOffset: false),

                crossAxisCount: 2,
                children: List.generate(
                  kDataStatsOfGrid.length,
                  (index) => Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kDataStatsOfGrid[index]['heading']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 40.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          kDataStatsOfGrid[index]['subheading']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,

                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // OUR MENTORS SLIDER

            Text(
              'Our Expert Mentors',
              style: GoogleFonts.openSans(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: kSliderImagesMentors.length,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height /2  ,
                  initialPage: _currentImageIndex2,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    setState(() {
                      _currentImageIndex2 = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              kSliderImagesMentors[index]['pic']!,
                              height: (index == _currentImageIndex2)
                                  ? MediaQuery.of(context).size.height * 1 / 3
                                  : MediaQuery.of(context).size.height * 1 / 3,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20,),
                            Text(kSliderImagesMentors[index]['name']!,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Calling copyrightArea widget from constants file
        CopyRightArea(adjust: EdgeInsets.only(top: 15)),
          ],
        ),
      ),

      // Navigation bar below screen

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 53,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavButton(icon: Icons.home, text: 'Home',isDarkMode: false, currentPage: 1),
            BottomNavButton(icon: Icons.laptop_chromebook, text: 'Courses',isDarkMode: false, currentPage: 1),
            BottomNavButton(icon: Icons.phone_android, text: 'Shorts',isDarkMode: false, currentPage: 1),
            BottomNavButton(icon: Icons.explore, text: 'Trending',isDarkMode: false, currentPage: 1),
            BottomNavButton(icon: Icons.person, text:  'My Profile',isDarkMode: false, currentPage: 1),
        ])
      ),
    );
  }
}