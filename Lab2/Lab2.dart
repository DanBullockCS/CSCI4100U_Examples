// CSCI4100 Lab 2
class Student {
  String sid;
  String name;
    
  // Constructor
  Student(String sid, String name) {
    this.sid = sid;
		this.name = name;
  }
  
  // toString() method
  String toString() { return "$sid: $name"; }
}

class Character {
 String name;
 int hp;
 int defense;

 Character({this.name, this.hp, this.defense});
}
class Player extends Character with Magic {
 Player({name, hp, magicDamage, mana, defense})
              : super(name: name, hp: hp, defense: defense) {
  this.mana = mana;
  this.magicDamage = magicDamage;
 }
}
class Enemy extends Character with Melee { 
 Enemy({name, hp, attackPower, stamina, defense})
              : super(name: name, hp: hp, defense: defense) {
  this.stamina = stamina;
  this.attackPower = attackPower;
 }
} 
class Magic {
  int magicDamage;
  int mana;
  
  int castSpell(Character c) {
    this.mana -= 10;
    int damage = this.magicDamage - c.defense;
    c.hp -= damage;
    return damage;
  }
}
class Melee {
  int stamina;
  int attackPower;
  
  int attack(Character c) {
    this.stamina -= 10;
    int damage = this.attackPower - c.defense;
    c.hp -= damage;
    return damage;
  }
}

void main() {
  print("Question 1."); // 1.
  List<double> grades = [44.5, 64.0, 89.0, 68.2, 95.4, 70.0, 75.3];
  print("Grades before scaling:\n$grades");
  var scaledGrades = grades.map((grade) => grade * 0.3);
  print("Grades after scaling from 0 to 30: \n" + scaledGrades.toList().toString());
  scaledGrades = scaledGrades.map((scaledGrades) => scaledGrades + 2);
  print("Grades after scaling from 2 to 32: \n" + scaledGrades.toList().toString());
  
  print("\nQuestion 2."); // 2.
  Student student1 = Student("100000001", "Kevin");
  Student student2 = Student("100000002", "Kevin2");
  Student student3 = Student("100000003", "Kevin3");
  print("Testing student class with ${student1.name}s.");
  print(student1.toString() + "\n" + student2.toString() + "\n" + student3.toString());
  
  print("\nQuestion 3. and 4."); // 3. and 4.
  List<int> intList = [4, 24, 23, 6, 3];
  
  final printStudent = (list) {
    var students = list.map((number) => (new Student("${100000000+number}", "Student #$number")));
    students.forEach(print);
  };
  printStudent(intList);
  
  print("\nQuestion 5 and 6."); // 5. and 6.
  Enemy enemy = Enemy();
  enemy.name = "Boss";
  enemy.hp = 100;
  enemy.attackPower = 40;
  enemy.stamina = 20;
  enemy.defense = 30;
  
  Player player = Player();
  player.name = "Player";
  player.hp = 50;
  player.magicDamage = 50;
  player.mana = 35;
  player.defense = 10;
  
  print("${enemy.name} hits ${player.name} for ${enemy.attack(player)} points of damage!");
  print("${enemy.name}'s stamina is now ${enemy.stamina}");
  print("${player.name} hits ${enemy.name} for ${player.castSpell(enemy)} points of damage!");
  print("${player.name}'s' mana is now ${player.mana}");
}