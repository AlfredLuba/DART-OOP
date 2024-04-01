import 'dart:io';

// Base class
class School {
  String headTeacher;
  List<Teacher> teachers;
  List<Student> students;

  School(this.headTeacher, this.teachers, this.students);

  void showSchoolInfo() {
    print('Head Teacher: $headTeacher');
    print('Teachers:');
    for (var teacher in teachers) {
      teacher.showTeacherInfo();
    }
    print('Students:');
    for (var student in students) {
      student.showStudentInfo();
    }
  }

  // Method demonstrating the use of a loop
  void listTeachers() {
    print('List of Teachers:');
    for (var teacher in teachers) {
      print('- ${teacher.name}');
    }
  }

  // Method to convert school data to string
  String schoolDataToString() {
    var data = StringBuffer();
    data.writeln(headTeacher);
    data.writeln(teachers.map((t) => '${t.name} (${t.id})').join(', '));
    data.writeln(students.map((s) => '${s.name} (${s.location})').join(', '));
    return data.toString();
  }
}

// Teacher class with ID
class Teacher {
  String name;
  int id;

  Teacher(this.name, this.id);

  void showTeacherInfo() {
    print('- $name (ID: $id)');
  }
}

// Student class with location
class Student {
  String name;
  String location;

  Student(this.name, this.location);

  void showStudentInfo() {
    print('- $name (Location: $location)');
  }
}

// Subclass inheriting from School
class PLPAfrica extends School {
  PLPAfrica(String headTeacher, List<Teacher> teachers, List<Student> students)
      : super(headTeacher, teachers, students);

  @override
  void showSchoolInfo() {
    print('PLP Africa');
    super.showSchoolInfo();
  }
}

void main() {
  // Read data from file
  var file = File('AllData.txt');
  if (file.existsSync()) {
    var lines = file.readAsLinesSync();

    // Extract data
    var headTeacher = lines[0];

    var teacherData = lines[1].split(', ');
    var teachers = <Teacher>[];
    for (var data in teacherData) {
      var parts = data.split(' (');
      var name = parts[0].trim();
      var id = int.parse(parts[1].replaceAll(')', '').trim());
      teachers.add(Teacher(name, id));
    }

    var studentData = lines[2].split(', ');
    var students = <Student>[];
    for (var data in studentData) {
      var parts = data.split(' (');
      var name = parts[0].trim();
      var location = parts[1].replaceAll(')', '').trim();
      students.add(Student(name, location));
    }

    // Create instance of PLP Africa
    var plpAfrica = PLPAfrica(headTeacher, teachers, students);

    // Show school information
    plpAfrica.showSchoolInfo();

    // List all teachers
    plpAfrica.listTeachers();
  } else {
    print('File not found.');
  }

  // Write data to file
  var headTeacher = 'Mr. Munene';
  var teachers = [
    Teacher('Mr. Allen', 204),
    Teacher('Mr. Erick', 205),
    Teacher('Mr. Monga', 206),
    Teacher('Mr. Andrew Kim', 208)
  ];
  var students = [
    Student('Phoebe', 'Kisumu'),
    Student('Alfred Balazire', 'Turkana'),
    Student('Josephat', 'Nairobi')
  ];

  var plpAfrica = PLPAfrica(headTeacher, teachers, students);
  var dataToWrite = plpAfrica.schoolDataToString();
  file.writeAsStringSync(dataToWrite);

  print('Data written to file.');
}
