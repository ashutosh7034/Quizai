import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../quizzes/quiz_analysis.dart'; // Import the analysis screen

class JavaQuizScreen extends StatefulWidget {
  @override
  _JavaQuizScreenState createState() => _JavaQuizScreenState();
}

class _JavaQuizScreenState extends State<JavaQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the main function in Java?',
      'options': ['main()', 'start()', 'init()', 'run()'],
      'answer': 'main()',
    },
    {
      'question': 'What does the keyword synchronized indicate?',
      'options': [
        'A method can be accessed by only one thread at a time',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method can be accessed by only one thread at a time',
    },
    {
      'question': 'Which keyword is used to create a class in Java?',
      'options': ['class', 'def', 'function', 'type'],
      'answer': 'class',
    },
    {
      'question': 'What is the size of int in Java?',
      'options': ['2 bytes', '4 bytes', '8 bytes', 'depends on the system'],
      'answer': '4 bytes',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString str = "Java";\nstr.concat("Programming");\nSystem.out.println(str);',
      'options': ['JavaProgramming', 'Java Programming', 'Java', 'Error'],
      'answer': 'Java',
    },
    {
      'question':
          'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'boolean'],
      'answer': 'String',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "abc";\nstr.replace("a", "d");\nSystem.out.println(str);',
      'options': ['abc', 'dbc', 'Error', 'None of the above'],
      'answer': 'abc',
    },
    {
      'question':
          'Which of the following can be used to create a singleton class in Java?',
      'options': [
        'Private constructor',
        'Static method',
        'Enum',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nint a = 5;\nint b = 10;\nb = a + b++;\nSystem.out.println(b);',
      'options': ['15', '16', '10', 'Error'],
      'answer': '16',
    },
    {
      'question':
          'What will happen if you try to compile the following code?\n\nint a = 10;\nint b = 20;\nif(a = b) {\n  System.out.println("Equal");\n}',
      'options': ['Equal', 'Error', 'False', 'None of the above'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following keywords is used to declare an abstract class in Java?',
      'options': ['abstract', 'interface', 'class', 'final'],
      'answer': 'abstract',
    },
    {
      'question':
          'What is the output of the following code?\n\nint[] arr = new int[5];\nSystem.out.println(arr[4]);',
      'options': ['0', 'null', '5', 'Error'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is used for thread synchronization in Java?',
      'options': [
        'synchronized keyword',
        'wait() method',
        'notify() method',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString str = "Java";\nstr = str.substring(1);\nSystem.out.println(str);',
      'options': ['Java', 'ava', 'J', 'Error'],
      'answer': 'ava',
    },
    {
      'question':
          'Which of the following statements is true regarding Java constructors?',
      'options': [
        'A constructor can return a value.',
        'A constructor can have the same name as the class.',
        'Constructors cannot be overloaded.',
        'Constructors can be private.'
      ],
      'answer': 'A constructor can have the same name as the class.',
    },
    {
      'question':
          'What will be the output of the following code?\n\nfor(int i = 0; i < 5; i++) {\n  if(i == 2) {\n    continue;\n  }\n  System.out.print(i);\n}',
      'options': ['01234', '0134', '1234', '01234'],
      'answer': '0134',
    },
    {
      'question':
          'Which of the following cannot be used as a key in a HashMap?',
      'options': ['String', 'Integer', 'Object', 'Mutable object'],
      'answer': 'Mutable object',
    },
    {
      'question':
          'What is the output of the following code?\n\nSystem.out.println(10 + 20 + "30" + 40 + 50);',
      'options': ['10203040', '103050', 'Error', '102030'],
      'answer': '10203040',
    },
    {
      'question':
          'Which of the following is not a valid type of exception in Java?',
      'options': ['RuntimeException', 'IOException', 'Error', 'ThrowException'],
      'answer': 'ThrowException',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint x = 0;\nfor(int i = 1; i <= 5; i++) {\n  x += i;\n}\nSystem.out.println(x);',
      'options': ['5', '15', '20', 'Error'],
      'answer': '15',
    },
    {
      'question':
          'Which of the following statements is correct about the finalize() method?',
      'options': [
        'It is called before an object is garbage collected.',
        'It can be called multiple times.',
        'It can be overridden.',
        'None of the above'
      ],
      'answer': 'It is called before an object is garbage collected.',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "Hello";\nstr = str.toLowerCase();\nSystem.out.println(str);',
      'options': ['Hello', 'hello', 'Error', 'None of the above'],
      'answer': 'hello',
    },
    {
      'question':
          'Which of the following keywords is used to define a class that cannot be subclassed?',
      'options': ['final', 'static', 'abstract', 'private'],
      'answer': 'final',
    },
    {
      'question':
          'What is the output of the following code?\n\nint x = 5;\nint y = 10;\ny = ++x * y++;\nSystem.out.println(y);',
      'options': ['55', '60', '50', 'Error'],
      'answer': '60',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString s1 = "Java";\nString s2 = "Java";\nSystem.out.println(s1.equals(s2));',
      'options': ['true', 'false', 'Error', 'None of the above'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following is not a feature of Java?',
      'options': [
        'Platform-independent',
        'Object-oriented',
        'Use of pointers',
        'Automatic garbage collection'
      ],
      'answer': 'Use of pointers',
    },
    {
      'question':
          'What is the output of the following code?\n\nint[] arr = {1, 2, 3};\nSystem.out.println(arr[3]);',
      'options': ['3', '2', 'Error', '0'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following is a valid way to declare a multi-dimensional array in Java?',
      'options': [
        'int[][] arr;',
        'int arr[][];',
        'int arr[5][5];',
        'Both a and b'
      ],
      'answer': 'Both a and b',
    },
    {
      'question':
          'What is the output of the following code?\n\nint a = 10;\nint b = 5;\nb = a + b++;\nSystem.out.println(b);',
      'options': ['15', '16', '10', 'Error'],
      'answer': '16',
    },
    {
      'question':
          'Which of the following methods is used to sort a list in Java?',
      'options': ['sort()', 'order()', 'arrange()', 'None of the above'],
      'answer': 'sort()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint x = 0;\nfor(int i = 1; i < 5; i++) {\n  x += i;\n}\nSystem.out.println(x);',
      'options': ['10', '15', '5', 'Error'],
      'answer': '10',
    },
    {
      'question':
          'Which of the following cannot be used in a synchronized method?',
      'options': ['this', 'ClassName.class', 'any object', 'static'],
      'answer': 'static',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "Java";\nstr = str + " Programming";\nSystem.out.println(str);',
      'options': ['JavaProgramming', 'Java Programming', 'Java', 'Error'],
      'answer': 'Java Programming',
    },
    {
      'question':
          'Which of the following statements is true regarding the main method in Java?',
      'options': [
        'It must be public.',
        'It must return void.',
        'It can be overloaded.',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint x = 5;\nint y = 10;\ny += x++;\nSystem.out.println(y);',
      'options': ['15', '16', '10', 'Error'],
      'answer': '15',
    },
    {
      'question':
          'Which of the following is not a valid way to handle exceptions in Java?',
      'options': [
        'try-catch block',
        'throw statement',
        'throws clause',
        'catch clause'
      ],
      'answer': 'catch clause',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint a = 10;\nif(a > 0) {\n  System.out.println("Positive");\n} else if(a < 0) {\n  System.out.println("Negative");\n} else {\n  System.out.println("Zero");\n}',
      'options': ['Positive', 'Negative', 'Zero', 'Error'],
      'answer': 'Positive',
    },
    {
      'question': 'Which of the following is a way to create a thread in Java?',
      'options': [
        'Extending Thread class',
        'Implementing Runnable interface',
        'Using Executor service',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "Java";\nString s1 = str + " Programming";\nSystem.out.println(s1);',
      'options': [
        'Java Programming',
        'JavaProgramming',
        'Error',
        'None of the above'
      ],
      'answer': 'Java Programming',
    },
    {
      'question': 'Which of the following is not a feature of Java?',
      'options': [
        'Platform-independent',
        'Object-oriented',
        'Use of pointers',
        'Automatic garbage collection'
      ],
      'answer': 'Use of pointers',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "123";\nint num = Integer.parseInt(str);\nSystem.out.println(num + 1);',
      'options': ['1231', '124', 'Error', '1241'],
      'answer': '124',
    },
    {
      'question': 'Which of the following cannot be overridden?',
      'options': [
        'static methods',
        'final methods',
        'private methods',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nSystem.out.println(10 + 20 + "30" + 40 + 50);',
      'options': ['103050', '102030', '10203040', 'Error'],
      'answer': '10203040',
    },
    {
      'question':
          'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'internal'],
      'answer': 'internal',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint x = 0;\nfor(int i = 0; i < 5; i++) {\n   x += i;\n}\nSystem.out.println(x);',
      'options': ['5', '10', '15', '20'],
      'answer': '10',
    },
    {
      'question':
          'Which of the following statements is true regarding Java interfaces?',
      'options': [
        'Interfaces can contain method implementations.',
        'Interfaces cannot extend other interfaces.',
        'A class can implement multiple interfaces.',
        'Interfaces can have constructors.'
      ],
      'answer': 'A class can implement multiple interfaces.',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString str = "Java";\nstr.concat(" Programming");\nSystem.out.println(str);',
      'options': ['Java Programming', 'Java', 'Java Programming', 'Error'],
      'answer': 'Java',
    },
    {
      'question':
          'Which of the following keywords is used to define a constant in Java?',
      'options': ['const', 'constant', 'final', 'static'],
      'answer': 'final',
    },
    {
      'question':
          'What is the output of the following code?\n\nint a = 10;\nint b = 20;\nSystem.out.println(a > b ? a : b);',
      'options': ['10', '20', 'Error', 'None of the above'],
      'answer': '20',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint[] arr = {1, 2, 3};\nSystem.out.println(arr[3]);',
      'options': ['1', '2', '3', 'ArrayIndexOutOfBoundsException'],
      'answer': 'ArrayIndexOutOfBoundsException',
    },
    {
      'question':
          'Which of the following collections allows duplicate elements in Java?',
      'options': ['HashSet', 'TreeSet', 'ArrayList', 'HashMap'],
      'answer': 'ArrayList',
    },
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '0', '1'],
      'answer': 'false',
    },
    {
      'question':
          'Which of the following is true about Java exception handling?',
      'options': [
        'Exceptions can be thrown without being caught.',
        'All exceptions must be checked.',
        'Runtime exceptions must be handled or declared.',
        'Finally block is executed only when an exception is thrown.'
      ],
      'answer': 'Exceptions can be thrown without being caught.',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString str = "Hello";\nstr = str.toUpperCase();\nSystem.out.println(str);',
      'options': ['hello', 'Hello', 'HELLO', 'Error'],
      'answer': 'HELLO',
    },
    {
      'question':
          'Which of the following is not a valid way to create a thread in Java?',
      'options': [
        'Extending Thread class',
        'Implementing Runnable interface',
        'Using ExecutorService',
        'Using Process class'
      ],
      'answer': 'Using Process class',
    },
    {
      'question':
          'What is the output of the following code?\n\nint x = 10;\nint y = 20;\ny = x++;\nSystem.out.println(y);',
      'options': ['10', '20', '0', 'Error'],
      'answer': '10',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str1 = "Java";\nString str2 = "Java";\nSystem.out.println(str1 == str2);',
      'options': ['true', 'false', 'Error', 'None of the above'],
      'answer': 'true',
    },
    {
      'question':
          'Which of the following statements is correct about Java garbage collection?',
      'options': [
        'Garbage collection occurs automatically.',
        'Garbage collection can be forced.',
        'Garbage collection is done by the JVM.',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nfor(int i = 0; i < 5; i++) {\n  if(i == 3) {\n    break;\n  }\n  System.out.print(i);\n}',
      'options': ['012', '0123', '123', '01234'],
      'answer': '012',
    },
    {
      'question':
          'Which of the following is used to compare two strings in Java?',
      'options': [
        '== operator',
        'equals() method',
        'compareTo() method',
        'Both b and c'
      ],
      'answer': 'Both b and c',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint[] arr = new int[3];\nSystem.out.println(arr[0]);',
      'options': ['0', 'null', 'Error', 'undefined'],
      'answer': '0',
    },
    {
      'question':
          'What is the output of the following code?\n\nString str = "abc";\nstr = str + "def";\nSystem.out.println(str.length());',
      'options': ['3', '6', '4', 'Error'],
      'answer': '6',
    },
    {
      'question':
          'Which of the following keywords is used to prevent a class from being subclassed in Java?',
      'options': ['static', 'final', 'abstract', 'synchronized'],
      'answer': 'final',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint x = 5;\nint y = 10;\ny += x++;\nSystem.out.println(y);',
      'options': ['15', '16', '10', 'Error'],
      'answer': '15',
    },
    {
      'question': 'Which of the following is not a feature of Java?',
      'options': [
        'Platform-independent',
        'Object-oriented',
        'Use of pointers',
        'Automatic garbage collection'
      ],
      'answer': 'Use of pointers',
    },
    {
      'question':
          'What is the output of the following code?\n\nint a = 5;\nint b = 10;\nSystem.out.println(a + b + " is the sum.");',
      'options': [
        '15 is the sum.',
        '510 is the sum.',
        'Error',
        'None of the above'
      ],
      'answer': '15 is the sum.',
    },
    {
      'question':
          'Which of the following statements about the "this" keyword is true?',
      'options': [
        'It refers to the current object.',
        'It can be used in static methods.',
        'It can refer to the parent class.',
        'None of the above'
      ],
      'answer': 'It refers to the current object.',
    },
    {
      'question':
          'What will be the output of the following code?\n\nSystem.out.println(3 + 2 + "5");',
      'options': ['5', '32', '35', 'Error'],
      'answer': '35',
    },
    {
      'question':
          'Which of the following exceptions is thrown when an application tries to use null in a case where an object is required?',
      'options': [
        'NullPointerException',
        'ArrayIndexOutOfBoundsException',
        'ClassCastException',
        'IllegalArgumentException'
      ],
      'answer': 'NullPointerException',
    },
    {
      'question':
          'What is the output of the following code?\n\nStringBuilder sb = new StringBuilder("Hello");\nsb.append(" World");\nSystem.out.println(sb);',
      'options': ['Hello', 'Hello World', 'HelloWorld', 'Error'],
      'answer': 'Hello World',
    },
    {
      'question': 'Which of the following methods cannot be overridden?',
      'options': [
        'final method',
        'static method',
        'private method',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nint a = 10;\nint b = 5;\nSystem.out.println(a > b ? a : b);',
      'options': ['10', '5', 'Error', 'None of the above'],
      'answer': '10',
    },
    {
      'question': 'Which of the following is a marker interface in Java?',
      'options': ['Serializable', 'Cloneable', 'Remote', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString s1 = "Hello";\nString s2 = "Hello";\nSystem.out.println(s1 == s2);',
      'options': ['true', 'false', 'Error', 'None of the above'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following is not a wrapper class in Java?',
      'options': ['Integer', 'Float', 'Double', 'Decimal'],
      'answer': 'Decimal',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString str = "Java";\nstr = str.substring(0, 2);\nSystem.out.println(str);',
      'options': ['Ja', 'ava', 'Java', 'Error'],
      'answer': 'Ja',
    },
    {
      'question':
          'What is the output of the following code?\n\nSystem.out.println(1 + 2 + "3" + 4 + 5);',
      'options': ['12345', '6', '12345', 'Error'],
      'answer': '12345',
    },
    {
      'question':
          'Which of the following statements is true about the main method in Java?',
      'options': [
        'It must be public.',
        'It must return void.',
        'It can be overloaded.',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nString s = "Hello";\ns = s.toLowerCase();\nSystem.out.println(s);',
      'options': ['HELLO', 'Hello', 'hello', 'Error'],
      'answer': 'hello',
    },
    {
      'question':
          'What is the output of the following code?\n\nfor(int i = 0; i < 5; i++) {\n  if(i == 2) {\n    continue;\n  }\n  System.out.print(i);\n}',
      'options': ['01234', '0134', '1234', '01234'],
      'answer': '0134',
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Java?',
      'options': ['try-catch', 'throw', 'throws', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the correct way to declare an array in Java?',
      'options': ['int arr[]', 'int[] arr', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question':
          'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'visible'],
      'answer': 'visible',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A method to initialize an object',
        'A method to destroy an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method to initialize an object',
    },
    {
      'question': 'How do you handle exceptions in Java?',
      'options': ['try and catch', 'throw', 'throws', 'None'],
      'answer': 'try and catch',
    },
    {
      'question': 'What is the difference between == and .equals()?',
      'options': [
        '== checks reference, .equals() checks value',
        'Both are the same',
        '.equals() checks reference, == checks value',
        'None'
      ],
      'answer': '== checks reference, .equals() checks value',
    },
    {
      'question': 'What is polymorphism?',
      'options': [
        'The ability to take on many forms',
        'The ability to inherit properties',
        'The ability to encapsulate data',
        'None'
      ],
      'answer': 'The ability to take on many forms',
    },
    {
      'question': 'What are interfaces in Java?',
      'options': [
        'Abstract classes',
        'Contracts for classes',
        'Concrete classes',
        'None'
      ],
      'answer': 'Contracts for classes',
    },
    {
      'question': 'What is the output of 5 + 2 + "3"?',
      'options': ['53', '73', 'Error', 'None'],
      'answer': '53',
    },
    {
      'question':
          'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'float'],
      'answer': 'String',
    },
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the correct way to declare an array in Java?',
      'options': ['int arr[]', 'int[] arr', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question':
          'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'visible'],
      'answer': 'visible',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A method to initialize an object',
        'A method to destroy an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method to initialize an object',
    },
    {
      'question': 'How do you handle exceptions in Java?',
      'options': ['try and catch', 'throw', 'throws', 'None'],
      'answer': 'try and catch',
    },
    {
      'question': 'What is the difference between == and .equals()?',
      'options': [
        '== checks reference, .equals() checks value',
        'Both are the same',
        '.equals() checks reference, == checks value',
        'None'
      ],
      'answer': '== checks reference, .equals() checks value',
    },
    {
      'question': 'What is polymorphism?',
      'options': [
        'The ability to take on many forms',
        'The ability to inherit properties',
        'The ability to encapsulate data',
        'None'
      ],
      'answer': 'The ability to take on many forms',
    },
    {
      'question': 'What are interfaces in Java?',
      'options': [
        'Abstract classes',
        'Contracts for classes',
        'Concrete classes',
        'None'
      ],
      'answer': 'Contracts for classes',
    },
    {
      'question': 'What is the output of 5 + 2 + "3"?',
      'options': ['53', '73', 'Error', 'None'],
      'answer': '53',
    },
    {
      'question':
          'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'float'],
      'answer': 'String',
    },
    {
      'question': 'What keyword is used to inherit a class in Java?',
      'options': ['inherits', 'extends', 'implements', 'base'],
      'answer': 'extends',
    },
    {
      'question': 'What is the main method signature in Java?',
      'options': [
        'public static void main()',
        'void main(String args[])',
        'public main(String args)',
        'static void main(String args)'
      ],
      'answer': 'public static void main(String args[])',
    },
    {
      'question': 'What is the purpose of the final keyword in Java?',
      'options': [
        'To declare constants',
        'To prevent method overriding',
        'To prevent inheritance',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'Which of the following is a collection framework class in Java?',
      'options': ['ArrayList', 'HashMap', 'LinkedList', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is a package in Java?',
      'options': [
        'A collection of classes',
        'A class type',
        'A variable type',
        'None of the above'
      ],
      'answer': 'A collection of classes',
    },
    {
      'question': 'What is the use of the super keyword in Java?',
      'options': [
        'To call the parent class constructor',
        'To call a method in the parent class',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the size of an int in Java?',
      'options': ['16 bits', '32 bits', '64 bits', '8 bits'],
      'answer': '32 bits',
    },
    {
      'question': 'What is the purpose of the this keyword in Java?',
      'options': [
        'To refer to the current class instance',
        'To refer to the parent class',
        'To refer to static methods',
        'None of the above'
      ],
      'answer': 'To refer to the current class instance',
    },
    {
      'question': 'What is an abstract class in Java?',
      'options': [
        'A class that cannot be instantiated',
        'A class with abstract methods',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'Which of the following is true about Java?',
      'options': [
        'Java is platform-independent',
        'Java is a compiled language',
        'Java is an interpreted language',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the static keyword?',
      'options': [
        'To declare a class variable',
        'To declare a method that belongs to the class',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does JVM stand for?',
      'options': [
        'Java Visual Machine',
        'Java Variable Machine',
        'Java Virtual Machine',
        'Java Verified Machine'
      ],
      'answer': 'Java Virtual Machine',
    },
    {
      'question': 'What is the output of 10 % 3?',
      'options': ['3', '1', '10', '0'],
      'answer': '1',
    },
    {
      'question': 'What is a nested class?',
      'options': [
        'A class defined within another class',
        'A class with multiple subclasses',
        'A class that cannot be instantiated',
        'None of the above'
      ],
      'answer': 'A class defined within another class',
    },
    {
      'question': 'What does the break statement do?',
      'options': [
        'Exits the loop',
        'Exits the method',
        'Continues the loop',
        'None of the above'
      ],
      'answer': 'Exits the loop',
    },
    {
      'question': 'What is the default value of an integer variable in Java?',
      'options': ['0', '1', 'null', 'undefined'],
      'answer': '0',
    },
    {
      'question': 'What is the purpose of the instanceof operator?',
      'options': [
        'To check if an object is an instance of a class',
        'To create a new instance of a class',
        'To check if two objects are equal',
        'None of the above'
      ],
      'answer': 'To check if an object is an instance of a class',
    },
    {
      'question': 'Which of the following is an interface?',
      'options': ['ArrayList', 'List', 'HashMap', 'String'],
      'answer': 'List',
    },
    {
      'question': 'What is the difference between a Set and a List?',
      'options': [
        'Set allows duplicate values, List does not',
        'List allows duplicate values, Set does not',
        'Both allow duplicates',
        'None'
      ],
      'answer': 'List allows duplicate values, Set does not',
    },
    {
      'question': 'Which keyword is used to create a new thread in Java?',
      'options': ['new', 'create', 'start', 'run'],
      'answer': 'new',
    },
    {
      'question': 'What is a runtime exception?',
      'options': [
        'An exception that occurs during compilation',
        'An exception that occurs during execution',
        'An exception that cannot be handled',
        'None of the above'
      ],
      'answer': 'An exception that occurs during execution',
    },
    {
      'question': 'What is the purpose of the volatile keyword?',
      'options': [
        'To prevent compiler optimization',
        'To ensure visibility of shared variables',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression (true && false)?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the function of the wait() method?',
      'options': [
        'To pause the execution of a thread',
        'To release the lock on an object',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the term garbage collection mean in Java?',
      'options': [
        'Automatically deallocating memory',
        'Manually deallocating memory',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Automatically deallocating memory',
    },
    {
      'question': 'What is the default size of an ArrayList?',
      'options': ['10', '20', '5', '0'],
      'answer': '10',
    },
    {
      'question': 'Which of the following is not a loop structure in Java?',
      'options': ['for', 'while', 'do while', 'repeat'],
      'answer': 'repeat',
    },
    {
      'question': 'What is a lambda expression in Java?',
      'options': [
        'A way to create anonymous functions',
        'A way to create interfaces',
        'A way to create arrays',
        'None of the above'
      ],
      'answer': 'A way to create anonymous functions',
    },
    {
      'question':
          'What is the difference between method overloading and method overriding?',
      'options': [
        'Overloading has the same name but different parameters, overriding has the same name and parameters',
        'Both are the same',
        'Overloading is for static methods, overriding is for instance methods',
        'None'
      ],
      'answer':
          'Overloading has the same name but different parameters, overriding has the same name and parameters',
    },
    {
      'question': 'What is the purpose of the yield() method?',
      'options': [
        'To pause the current thread',
        'To terminate the current thread',
        'To allow other threads to execute',
        'None of the above'
      ],
      'answer': 'To allow other threads to execute',
    },
    {
      'question': 'Which method is used to start a thread?',
      'options': ['run()', 'start()', 'init()', 'execute()'],
      'answer': 'start()',
    },
    {
      'question': 'What is the significance of the hashCode() method?',
      'options': [
        'To uniquely identify an object',
        'To compare two objects',
        'To calculate the memory address',
        'None of the above'
      ],
      'answer': 'To uniquely identify an object',
    },
    {
      'question': 'What does the throw statement do?',
      'options': [
        'Throws an exception',
        'Creates a new exception',
        'Catches an exception',
        'None of the above'
      ],
      'answer': 'Throws an exception',
    },
    {
      'question': 'What is the output of 5 + 2 * 3?',
      'options': ['21', '11', '16', 'None'],
      'answer': '11',
    },
    {
      'question': 'What is an enum in Java?',
      'options': [
        'A way to define a set of constants',
        'A way to define a class',
        'A way to define an interface',
        'None of the above'
      ],
      'answer': 'A way to define a set of constants',
    },
    {
      'question':
          'Which of the following is used to handle checked exceptions?',
      'options': [
        'try-catch block',
        'throw keyword',
        'throws keyword',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the expression 10 / 3?',
      'options': ['3', '3.0', '3.3333', 'None'],
      'answer': '3',
    },
    {
      'question': 'What is method overriding?',
      'options': [
        'Defining a method in a subclass with the same name and parameters as in the parent class',
        'Defining a method in the same class',
        'Both a and b',
        'None of the above'
      ],
      'answer':
          'Defining a method in a subclass with the same name and parameters as in the parent class',
    },
    {
      'question':
          'Which of the following is not a part of Java exception handling?',
      'options': ['throw', 'throws', 'catch', 'raise'],
      'answer': 'raise',
    },
    {
      'question': 'What does the finalize() method do?',
      'options': [
        'Called by the garbage collector before an object is deleted',
        'Called when a method is finished',
        'Called when a class is initialized',
        'None of the above'
      ],
      'answer': 'Called by the garbage collector before an object is deleted',
    },
    {
      'question': 'What is the purpose of the import statement?',
      'options': [
        'To include other classes and packages',
        'To define a new class',
        'To create an interface',
        'None of the above'
      ],
      'answer': 'To include other classes and packages',
    },
    {
      'question': 'Which of the following is a valid declaration of a string?',
      'options': [
        'String s = "Hello";',
        'String s = new String("Hello");',
        'Both a and b',
        'None'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the continue statement do?',
      'options': [
        'Skips the current iteration of a loop',
        'Exits the loop',
        'Ends the program',
        'None of the above'
      ],
      'answer': 'Skips the current iteration of a loop',
    },
    {
      'question': 'What is the use of the clone() method?',
      'options': [
        'To create a copy of an object',
        'To delete an object',
        'To compare two objects',
        'None of the above'
      ],
      'answer': 'To create a copy of an object',
    },
    {
      'question': 'Which of the following is not a keyword in Java?',
      'options': ['void', 'class', 'interface', 'method'],
      'answer': 'method',
    },
    {
      'question': 'What is a data structure?',
      'options': [
        'A way to store and organize data',
        'A method to process data',
        'A function to manipulate data',
        'None of the above'
      ],
      'answer': 'A way to store and organize data',
    },
    {
      'question': 'What is the output of the expression 3 == 3.0?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the purpose of the StringBuilder class?',
      'options': [
        'To create mutable strings',
        'To create immutable strings',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'To create mutable strings',
    },
    {
      'question': 'What is the role of the main thread in Java?',
      'options': [
        'To execute the main method',
        'To create new threads',
        'To manage memory',
        'None of the above'
      ],
      'answer': 'To execute the main method',
    },
    {
      'question': 'What is the use of the System.out.println() method?',
      'options': [
        'To print text to the console',
        'To create a new line',
        'To read input',
        'None of the above'
      ],
      'answer': 'To print text to the console',
    },
    {
      'question':
          'What is the difference between StringBuffer and StringBuilder?',
      'options': [
        'StringBuffer is synchronized, StringBuilder is not',
        'Both are the same',
        'StringBuilder is synchronized, StringBuffer is not',
        'None'
      ],
      'answer': 'StringBuffer is synchronized, StringBuilder is not',
    },
    {
      'question': 'What does the parseInt() method do?',
      'options': [
        'Converts a string to an integer',
        'Converts an integer to a string',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Converts a string to an integer',
    },
    {
      'question':
          'Which of the following can be used to iterate through a collection?',
      'options': ['for loop', 'while loop', 'Iterator', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the toString() method?',
      'options': [
        'To return a string representation of an object',
        'To convert a string to an integer',
        'To compare two strings',
        'None of the above'
      ],
      'answer': 'To return a string representation of an object',
    },
    {
      'question': 'What is the purpose of the super() constructor?',
      'options': [
        'To call the parent class constructor',
        'To create a new object',
        'To initialize variables',
        'None of the above'
      ],
      'answer': 'To call the parent class constructor',
    },
    {
      'question': 'Which of the following is true about Java arrays?',
      'options': [
        'Arrays are fixed in size',
        'Arrays can hold different data types',
        'Both a and b',
        'None'
      ],
      'answer': 'Arrays are fixed in size',
    },
    {
      'question': 'What is the purpose of the main(String[] args) parameter?',
      'options': [
        'To accept command-line arguments',
        'To accept input from the user',
        'To return a value',
        'None of the above'
      ],
      'answer': 'To accept command-line arguments',
    },
    {
      'question':
          'Which of the following is an example of a checked exception?',
      'options': [
        'NullPointerException',
        'IOException',
        'ArithmeticException',
        'ArrayIndexOutOfBoundsException'
      ],
      'answer': 'IOException',
    },
    {
      'question': 'What does the type casting operator do?',
      'options': [
        'Converts a variable from one type to another',
        'Creates a new variable',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Converts a variable from one type to another',
    },
    {
      'question': 'What is a syntax error?',
      'options': [
        'An error in the code syntax',
        'An error during runtime',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'An error in the code syntax',
    },
    {
      'question':
          'What is the output of the following code: int a = 5; int b = 2; System.out.println(a / b);',
      'options': ['2', '2.5', '3', 'None'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is a method of the Math class?',
      'options': ['abs()', 'max()', 'min()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the instanceof operator?',
      'options': [
        'To test if an object is an instance of a class',
        'To compare two objects',
        'To check for null',
        'None of the above'
      ],
      'answer': 'To test if an object is an instance of a class',
    },
    {
      'question':
          'What is the difference between the ArrayList and LinkedList classes?',
      'options': [
        'ArrayList is faster for random access, LinkedList is faster for sequential access',
        'Both are the same',
        'LinkedList is faster for random access, ArrayList is faster for sequential access',
        'None'
      ],
      'answer':
          'ArrayList is faster for random access, LinkedList is faster for sequential access',
    },
    {
      'question':
          'Which of the following is a valid way to create an object in Java?',
      'options': [
        'ClassName obj = new ClassName();',
        'ClassName obj;',
        'ClassName obj = new ClassName;',
        'None'
      ],
      'answer': 'ClassName obj = new ClassName();',
    },
    {
      'question': 'What does the join() method do in a thread?',
      'options': [
        'Waits for a thread to die',
        'Starts a thread',
        'Interrupts a thread',
        'None of the above'
      ],
      'answer': 'Waits for a thread to die',
    },
    {
      'question':
          'Which of the following is not a valid way to compare two strings?',
      'options': [
        '== operator',
        '.equals() method',
        'compareTo() method',
        'None'
      ],
      'answer': '== operator',
    },
    {
      'question': 'What does the split() method do?',
      'options': [
        'Splits a string into an array',
        'Joins two strings',
        'Compares two strings',
        'None of the above'
      ],
      'answer': 'Splits a string into an array',
    },
    {
      'question': 'What is the purpose of the finally block?',
      'options': [
        'To execute code regardless of whether an exception occurred',
        'To catch exceptions',
        'To define a method',
        'None of the above'
      ],
      'answer': 'To execute code regardless of whether an exception occurred',
    },
    {
      'question': 'What is a thread pool?',
      'options': [
        'A group of worker threads',
        'A single thread',
        'A method to execute multiple threads',
        'None of the above'
      ],
      'answer': 'A group of worker threads',
    },
    {
      'question': 'Which of the following is a Java keyword?',
      'options': ['import', 'include', 'require', 'load'],
      'answer': 'import',
    },
    {
      'question':
          'What is the output of the following code: System.out.println(10 % 3);',
      'options': ['3', '1', '10', 'None'],
      'answer': '1',
    },
    {
      'question': 'What is the role of the garbage collector?',
      'options': [
        'To free up memory by deleting unused objects',
        'To manage threads',
        'To optimize performance',
        'None of the above'
      ],
      'answer': 'To free up memory by deleting unused objects',
    },
    {
      'question': 'What does the keyword static indicate?',
      'options': [
        'A variable or method belongs to the class rather than instances of the class',
        'A variable or method is constant',
        'A variable or method is private',
        'None of the above'
      ],
      'answer':
          'A variable or method belongs to the class rather than instances of the class',
    },
    {
      'question': 'What is the output of the expression "Hello".length()?',
      'options': ['5', '4', '6', 'None'],
      'answer': '5',
    },
    {
      'question':
          'Which of the following is an example of a runtime exception?',
      'options': [
        'ArrayIndexOutOfBoundsException',
        'IOException',
        'ClassNotFoundException',
        'None'
      ],
      'answer': 'ArrayIndexOutOfBoundsException',
    },
    {
      'question': 'What does the keyword final indicate?',
      'options': [
        'A variable, method, or class cannot be changed',
        'A variable is static',
        'A method is abstract',
        'None of the above'
      ],
      'answer': 'A variable, method, or class cannot be changed',
    },
    {
      'question': 'Which of the following is used to create a new thread?',
      'options': ['Runnable interface', 'Thread class', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the use of the assert statement?',
      'options': [
        'To create test cases',
        'To check assumptions during runtime',
        'To handle exceptions',
        'None of the above'
      ],
      'answer': 'To check assumptions during runtime',
    },
    {
      'question': 'What is the purpose of the void keyword?',
      'options': [
        'Indicates a method does not return a value',
        'Indicates a method returns an integer',
        'Indicates a method is private',
        'None of the above'
      ],
      'answer': 'Indicates a method does not return a value',
    },
    {
      'question': 'What is the output of the expression "5" + 2?',
      'options': ['7', '52', 'Error', 'None'],
      'answer': '52',
    },
    {
      'question': 'What is the use of the synchronize keyword?',
      'options': [
        'To prevent thread interference',
        'To optimize performance',
        'To create synchronized methods',
        'None of the above'
      ],
      'answer': 'To prevent thread interference',
    },
    {
      'question': 'Which of the following is a valid comment in Java?',
      'options': [
        '// This is a comment',
        '/* This is a comment */',
        '# This is a comment',
        'Both a and b'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the keyword volatile indicate?',
      'options': [
        'A variable can be modified by multiple threads',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A variable can be modified by multiple threads',
    },
    {
      'question': 'What is the purpose of the break statement?',
      'options': [
        'To exit a loop or switch statement',
        'To skip an iteration',
        'To end a program',
        'None of the above'
      ],
      'answer': 'To exit a loop or switch statement',
    },
    {
      'question': 'What is the output of the expression "true && false"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'false',
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Java?',
      'options': ['try', 'catch', 'finally', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What does the keyword transient indicate?',
      'options': [
        'A variable should not be serialized',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A variable should not be serialized',
    },
    {
      'question': 'What is the purpose of the Comparable interface?',
      'options': [
        'To define a natural ordering for objects',
        'To compare two objects',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression "false || true"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the use of the StringTokenizer class?',
      'options': [
        'To split strings into tokens',
        'To join strings',
        'To compare strings',
        'None of the above'
      ],
      'answer': 'To split strings into tokens',
    },
    {
      'question': 'What does the keyword synchronized indicate?',
      'options': [
        'A method can be accessed by only one thread at a time',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method can be accessed by only one thread at a time',
    },
    {
      'question': 'What is the output of the expression "5 == 5.0"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What does the keyword native indicate?',
      'options': [
        'A method is implemented in native code',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method is implemented in native code',
    },
    {
      'question':
          'Which of the following is used to create an immutable object?',
      'options': [
        'String class',
        'StringBuilder class',
        'StringBuffer class',
        'None of the above'
      ],
      'answer': 'String class',
    },
    {
      'question': 'What is the purpose of the HashMap class?',
      'options': [
        'To store key-value pairs',
        'To store a list of elements',
        'To create a set of elements',
        'None of the above'
      ],
      'answer': 'To store key-value pairs',
    },
    {
      'question': 'What does the keyword abstract indicate?',
      'options': [
        'A class cannot be instantiated',
        'A method has no body',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression "10 / 2 * 3"?',
      'options': ['15', '5', '6', 'None'],
      'answer': '15',
    },
    {
      'question': 'What is the use of the ListIterator interface?',
      'options': [
        'To iterate over a list in both directions',
        'To iterate over a collection',
        'To create a list',
        'None of the above'
      ],
      'answer': 'To iterate over a list in both directions',
    },
    {
      'question': 'What is the output of the expression "2 + 2 + 2 + "2""?',
      'options': ['6', '22', 'Error', 'None'],
      'answer': '222',
    },
    {
      'question': 'What is the purpose of the this keyword?',
      'options': [
        'To refer to the current object',
        'To create a new object',
        'To call a method',
        'None of the above'
      ],
      'answer': 'To refer to the current object',
    },
    {
      'question': 'What does the keyword strictfp indicate?',
      'options': [
        'Floating-point calculations follow strict rules',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'Floating-point calculations follow strict rules',
    },
    {
      'question': 'What is the use of the java.util.Date class?',
      'options': [
        'To represent date and time',
        'To format dates',
        'To manipulate strings',
        'None of the above'
      ],
      'answer': 'To represent date and time',
    },
    {
      'question': 'What does the keyword instanceof do?',
      'options': [
        'Checks if an object is an instance of a class',
        'Creates a new instance of a class',
        'Destroys an object',
        'None of the above'
      ],
      'answer': 'Checks if an object is an instance of a class',
    },
    {
      'question': 'What is the output of the expression "true && true"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
  ];

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;
  Timer? _timer;
  int _timeLeft = 10; // Time limit for each question (changed to 10 seconds)
  bool _answered = false; // Track if the current question is answered

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Java Quiz', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: totalQuestions == 0 ? _buildQuestionInput() : _buildQuiz(),
        ),
      ),
    );
  }

  Widget _buildQuestionInput() {
    final TextEditingController questionCountController =
        TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Enter the number of questions you want to practice:',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: questionCountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Number of Questions',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            int? count = int.tryParse(questionCountController.text);
            if (count != null && count > 0) {
              setState(() {
                totalQuestions =
                    count > questions.length ? questions.length : count;
                selectedQuestions = _getRandomQuestions(totalQuestions);
                selectedAnswers = List.filled(totalQuestions, '');
                currentQuestionIndex = 0;
                _answered = false;
                _startTimer();
              });
            }
          },
          child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildQuiz() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: MediaQuery.of(context).size.height, // Ensures full height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.withOpacity(0.7),
              Colors.purpleAccent.withOpacity(0.7)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          // Scrollable content
          child: Column(
            key: ValueKey<int>(currentQuestionIndex),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Question ${currentQuestionIndex + 1} of $totalQuestions',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                selectedQuestions[currentQuestionIndex]['question'],
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Time Left: $_timeLeft seconds',
                style: TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
              const SizedBox(height: 20),
              Column(
                // Options in a Column for better scrolling
                mainAxisAlignment: MainAxisAlignment.center,
                children: selectedQuestions[currentQuestionIndex]['options']
                    .map<Widget>((option) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                      onPressed: _answered ? null : () => selectAnswer(option),
                      child: Text(option, style: const TextStyle(fontSize: 18)),
                    ),
                  );
                }).toList(),
              ),
              if (_answered)
                ElevatedButton(
                  onPressed: moveToNextQuestion,
                  child: const Text('Next', style: TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timeLeft = 10; // Time set to 10 seconds
    _answered = false;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          moveToNextQuestion();
        }
      });
    });
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _answered = false;
      });
      _startTimer();
    } else {
      _showResultDialog();
    }
  }

  List<Map<String, dynamic>> _getRandomQuestions(int count) {
    final random = Random();
    List<Map<String, dynamic>> shuffledQuestions = List.from(questions)
      ..shuffle(random);
    return shuffledQuestions.take(count).toList();
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
      _answered = true;
      _timer?.cancel();
    });
    // Automatically move to the next question after selecting an answer
    Future.delayed(const Duration(seconds: 1), moveToNextQuestion);
  }

  void _showResultDialog() {
    int score = 0;
    for (int i = 0; i < selectedQuestions.length; i++) {
      if (selectedAnswers[i] == selectedQuestions[i]['answer']) {
        score++;
      }
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuizAnalysisScreen(
          score: score,
          totalQuestions: totalQuestions,
          selectedQuestions: selectedQuestions,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }
}
