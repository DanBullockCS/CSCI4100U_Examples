String getName() {return "Kodi"; }

String printName(name) {print(name);}

printStudent({sid, firstName, lastName}) {
  print("Sid: $sid, fname: $firstName, lname: $lastName");
}

void main() {
  String firstName; // default null
  var lastName = "Sureshkumar";
  
  dynamic x = "Dart";
  x = 8.5;
  
  const language = "Dart"; // const is initialized at compile time
  final String name = getName(); // final variables intialized at runtime
  
  List<String> names = [
    "Kevin",
    "Blevin",
    "Seven",
    "Heaven",
  ];
  names.add("Samuel");
  print("Named Functions:");
  names.forEach(printName);
  
  print("Anon Functions:");
  names.forEach((name) {
    print(name);
  });
  
  print("Lambda Functions:");
  names.forEach((name) => print(name));
  
//   List<Function> ops = [
//     (a,b) => a + b,
//     (a,b) => a - b,
//   ];
  
  String the_name = "Randy";
  if (the_name == "Randy") {
    print("The world makes sense");
  }
  
  // Dictionary
  Map<String,int> wordCount = {
    "the": 18,
    "dog": 3,
    "cat": 4,
    "cheese": 1,
  };
  wordCount["the"]++; // found another the, increment the value
  
  print("The world the appeared ${wordCount["the"] + 1} times");
  print("You owe me \$420!");
  
  var names2 = names.map((name) => name + "*");
  names2.forEach(print);
  
  var cards = [1, 2, 3, 4, 5, 6];
  var sum = cards.reduce((num1, num2) => num1 + num2); // passing num1 and num2 and returning sum
  cards.forEach((card) => print("$card"));
  print ("Sum: $sum");
  var evens = cards.where((num) {
    if ((num % 2) == 0)
       return true;
    else
       return false;
    });
  // Making sure card is valid card
  cards.every((card) => card <= 10 && card >= 1);
  
  printStudent (
    sid: "100000000",
    firstName: "Jon",
    lastName: "Perry",
  );
}

