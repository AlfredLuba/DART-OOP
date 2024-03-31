class School {
  String headTeacher;
  List<Teacher> teachers;
  List<Student> students;

  
 // Constructor
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
  // Initializing data for PLP Africa
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
  
  // Creating instance of PLP Africa
  var plpAfrica = PLPAfrica(headTeacher, teachers, students);
  
  // Showing school information
  plpAfrica.showSchoolInfo();

  // Calling the method to list all teachers
  plpAfrica.listTeachers();
}
