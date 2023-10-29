import 'package:flutter/material.dart';

class Course {
  String title;
  String category;
  int progress;
  int total;
  String imageUrl;

  Course(this.title, this.category, this.progress, this.total,this.imageUrl);
}

class Mycoursepage extends StatelessWidget {
  final List<Course> ongoingCourses = [
    Course('Introduction of Figma', 'UI/UX', 20, 25,'assets/IntoToFig.jpeg'),
    Course('Logo Design Basics', 'Design', 20, 25,'assets/logo.jpeg'),
    Course('From Idea to Startup', 'Business', 20, 25,'assets/startup.jpeg'),
    Course('Introduction with Python', 'AI/ML', 20, 25,'assets/python2.png'),
  ];

  final List<Course> completedCourses = [
    Course('Photoshop Basics', 'UI/UX', 25, 25,'assets/IntoToFig.jpeg'),
    Course('Homemade Pasta', 'Design', 25, 25,'assets/pasta.jpg'),
    Course('Java Advance', 'Business', 25, 25,'assets/java.png'),
    Course('SEO Strategies', 'AI/ML', 25, 25,'assets/seo.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'My Course',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.all(10.0),
              child: OutlinedButton(
                onPressed: () {
                  // Add your back button functionality here
                },
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(color: Colors.blueGrey),
                  padding: EdgeInsets.all(2), // Adjust button size
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25, // Adjust icon size
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  tabs: [
                    Tab(child:Text(
                      "Ongoing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),),
                    Tab(child:Text(
                      "Completed",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),),
                  ],
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.label, // Adjust underline size
                  indicatorColor: Colors.blue, // Color of selected tab indicator
                  unselectedLabelColor: Colors.grey, // Color of unselected labels
                  labelColor: Colors.blue, // Color of selected label
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: ongoingCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCourseCard(ongoingCourses[index]);
                },
              ),
              ListView.builder(
                itemCount: completedCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCourseCard(completedCourses[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return InkWell(
      onTap: () {
        // Handle click event here
      },
      onHover: (bool hover) {
        // Handle hover event here
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: double.infinity, // Set width to fill the screen
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              course.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    course.category,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: course.progress / course.total,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),),
                      SizedBox(width: 10),
                      Text(
                        '${course.progress}/${course.total}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}