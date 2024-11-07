import 'package:flutter/material.dart';
import 'package:flutter_onboarding/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MainApp(showHome: showHome));
}

class MainApp extends StatelessWidget {
  final bool showHome;
  const MainApp({
    super.key,
    required this.showHome,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.teal,
      ),
      home: showHome ? HomePage() : OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SizedBox(height: 64),
              Text(
                title,
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 64),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 4);
          },
          children: <Widget>[
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page_1.png',
              title: 'PAGE 1',
              subtitle:
                  'Lorem ipsum odor amet, consectetuer adipiscing elit. Dis curae euismod condimentum feugiat hac dignissim lectus sapien aliquam. Platea vehicula per urna vehicula mi, suscipit scelerisque. Hac facilisis nulla senectus eu massa semper. Egestas convallis tempor lobortis integer convallis viverra. Erat ac cubilia sapien vivamus posuere natoque dictumst. Mus ipsum aliquam leo nullam inceptos sollicitudin. Etiam per mi eros suscipit maecenas litora nec. Dui ex lectus taciti hac pellentesque.',
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page_2.png',
              title: 'PAGE 2',
              subtitle:
                  'Nascetur habitant nibh congue rutrum dictum curae lobortis laoreet. Leo metus risus litora lobortis ut. Consectetur suscipit mus turpis lacinia arcu justo parturient pellentesque nascetur. Congue elementum rhoncus magna sagittis ac vivamus potenti. Condimentum pulvinar venenatis sollicitudin parturient hendrerit. Cras potenti odio rhoncus pretium facilisi id elit. Senectus dis vestibulum curabitur porttitor ipsum donec viverra vulputate.',
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page_3.png',
              title: 'PAGE 3',
              subtitle:
                  'Amet varius semper urna varius netus facilisis. Cursus suscipit bibendum ornare per sem. Ornare tincidunt nec primis luctus elementum; consectetur leo. Tristique nulla montes nam vitae; curabitur ex libero tincidunt phasellus. Duis ornare ultrices luctus ultricies lacus tortor est. Placerat tempor turpis tortor placerat eleifend rutrum. Duis dignissim quis laoreet mi sit morbi. Torquent a varius natoque libero platea. Quisque lectus praesent cursus, congue maecenas curabitur imperdiet ipsum quisque. Fames congue eu aenean nec duis.',
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page_4.png',
              title: 'PAGE 4',
              subtitle:
                  'Netus orci et vitae in diam vivamus. Curabitur bibendum ac velit torquent urna vehicula velit interdum. Interdum curabitur inceptos habitant massa purus faucibus platea tempus. Nibh facilisi non adipiscing imperdiet fames hendrerit sagittis ultrices. Hendrerit maecenas habitant proin ad, sapien fames venenatis lectus. Parturient facilisis feugiat pellentesque parturient per varius varius libero? Vehicula venenatis velit consequat imperdiet varius. Eu tincidunt parturient ridiculus nisl taciti dui class iaculis cras.',
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page_5.png',
              title: 'PAGE 5',
              subtitle:
                  'In augue vestibulum diam bibendum primis. Nulla justo turpis; dis cras ornare semper. Lobortis facilisi egestas nisi lacus torquent. Risus suscipit dolor nunc habitant odio. Faucibus accumsan purus nec fermentum nec fames. Praesent nascetur mollis metus molestie commodo lorem aenean fames. Tellus dapibus penatibus augue nascetur torquent luctus primis diam. Nibh nulla eget erat aliquet at taciti maecenas.',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.teal.shade700,
                minimumSize: Size.fromHeight(80),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () => controller.jumpToPage(4),
                    child: Text('SKIP'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 5,
                      effect: WormEffect(
                        spacing: 12,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade500,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text('NEXT'),
                  ),
                ],
              ),
            ),
    );
  }
}
