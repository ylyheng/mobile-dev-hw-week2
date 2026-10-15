enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  // Q1
  late String _name;
  late double _baseSalary;
  late List<Skill> _skills;
  late Address _address;
  late int _yearsOfExperience;

  //Q2
  Employee(String name, double baseSalary, List<Skill> skills, Address address, int yearsOfExperience) {
    _name = name;
    _baseSalary = baseSalary;
    _skills = skills;
    _address = address;
    _yearsOfExperience = yearsOfExperience;
  }

  Employee.mobileDeveloper(
      String name, double baseSalary, Address address, int yearsOfExperience) {
    _name = name;
    _baseSalary = baseSalary;
    _skills = [Skill.FLUTTER, Skill.DART];
    _address = address;
    _yearsOfExperience = yearsOfExperience;
  }

  //Q3
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  //Q4
  double calculateSalary() {
    double total = _baseSalary;

    total = total + _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
      if (skill == Skill.FLUTTER) {
        total = total + 5000;
      } else if (skill == Skill.DART) {
        total = total + 3000;
      } else {
        total = total + 1000;
      }
    }

    return total;
  }
}

void main() {
  Address address1 = Address('Street 1', 'Phnom Penh', '12000');

  Employee emp1 =Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], address1, 2);
  Employee emp2 = Employee('Ronan', 45000, [Skill.OTHER], address1, 1);
  Employee emp3 = Employee.mobileDeveloper('Dara', 40000, address1, 3);

  print('${emp1.name}: ${emp1.calculateSalary()}');
  print('${emp2.name}: ${emp2.calculateSalary()}');
  print('${emp3.name}: ${emp3.calculateSalary()}');
}