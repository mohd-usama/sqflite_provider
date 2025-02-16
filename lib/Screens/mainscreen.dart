import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_curd_demo/Screens/add_user.dart';
import 'package:sqflite_curd_demo/Screens/get_user.dart';
import 'package:sqflite_curd_demo/Screens/user_provider.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sqflite Database")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).reset();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
                },
                child: Text("Add User")),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) => GetUserDetails()));
                  // reverseString("Flutterdemo");
                  //mergeTwoList();
                  // characterCount("Flutter");
                  // checkPrimeNumber(0, 100);
                  // fibonnaciSeries(5);
                  // palindromeString("Madam");
                  // palindromeInt(3553);
                  // sumOfListGivenTarget(10);
                  // bubbleSort();
                  // selectionSort();
                  // insertionSort();
                  // linearSearch();
                  // print(binarySearch());
                  // findMisisngElement();
                  // largestSmallestElementInList();
                  // duplicateElementList();
                  // searchRotatedSortedArray();
                  // mergeTwoSortedArray();
                  // mergeTwoSortedArray2();
                  // quickSort();
                  mergeSortCustom();
                },
                child: Text("Get User")),
          ],
        ),
      ),
    );
  }

  void reverseString(String value) {
    StringBuffer buffer = StringBuffer();
    for (int i = value.length - 1; i >= 0; i--) {
      buffer.write(value[i]);
    }
    print(buffer);
  }

  void mergeTwoList() {
    List<int> listOne = [1, 2, 3, 4, 5];
    List<int> listTwo = [6, 7, 8, 9, 0];
    listOne.addAll(listTwo);
    print(listOne);
    List three = [];
    three = [...listTwo, ...listOne];
    print(three);
  }

  void characterCount(String value) {
    String data = value.trim().toLowerCase().replaceAll(" ", "");

    Map<String, int> countChar = {};

    for (var dataChar in data.split("")) {
      countChar[dataChar] = (countChar[dataChar] ?? 0) + 1;
    }

    print(countChar);
  }

  void checkPrimeNumber(int star, int end) {
    List<int> primeNumberList = [];

    for (int i = star; i <= end; i++) {
      if (checkPrime(i)) {
        primeNumberList.add(i);
      }
    }
    print(primeNumberList);
  }

  bool checkPrime(int num) {
    for (int i = 2; i * i <= num; i++) {
      if (num % i == 0) {
        print("$num is not a prime number");
        return false;
      }
    }

    print("$num is a prime number");
    return true;
  }

  void fibonnaciSeries(int number) {
    List<int> resultList = [0, 1];
    int num1 = 0, num2 = 1;

    for (int i = 2; i < number; i++) {
      // resultList.add(resultList[i - 1] + resultList[i - 2]);
      //
      int num3 = num2 + num1;
      num1 = num2;
      num2 = num3;
      resultList.add(num2);
    }
    print(resultList);
  }

  void palindromeString(String s) {
    String oldString = s.toLowerCase().trim();
    String oldString2 = s.toLowerCase().trim();
    StringBuffer buffer = StringBuffer();
    for (int i = oldString2.toLowerCase().length - 1; i >= 0; i--) {
      buffer.write(oldString2[i]);
    }

    if (oldString == buffer.toString()) {
      print("is Palindrone");
    } else {
      print("not palindrome");
    }
  }

  void palindromeInt(int number) {
    int originalInt = number;
    int reverseNumber = 0, remainder = 0;

    while (number != 0) {
      remainder = number % 10;
      print(remainder);
      reverseNumber = reverseNumber * 10 + remainder;
      print(reverseNumber);
      number ~/= 10;
      print(number);
    }

    if (originalInt == reverseNumber) {
      print("its palindrome");
    } else {
      print("its not palindrome");
    }
  }

  void sumOfListGivenTarget(int target) {
    List numberList = [1, 2, 3, 5, 7, 8, 3, 6, 7, 5, 3];

    for (int i = 0; i < numberList.length; i++) {
      for (int j = i + 1; j < numberList.length; j++) {
        if (numberList[i] + numberList[j] == target) {
          print(numberList[i] + numberList[j]);
          print([i, j]);
        }
      }
    }
  }

  void bubbleSort() {
    List arr = [2, 3, 1, 7, 0];

    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
    print(arr);
  }

  void selectionSort() {
    List arr = [2, 3, 1, 7, 0];

    for (int i = 0; i < arr.length - 1; i++) {
      int smallest = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[smallest] > arr[j]) {
          smallest = j;
        }
      }
      int temp = arr[smallest];
      arr[smallest] = arr[i];
      arr[i] = temp;
    }
    print(arr);
  }

  void insertionSort() {
    List arr = [2, 3, 1, 7, 0];

    for (int i = 1; i < arr.length; i++) {
      int current = arr[i];
      int previous = i - 1;
      while (previous >= 0 && current < arr[previous]) {
        arr[previous + 1] = arr[previous];
        previous--;
      }

      arr[previous + 1] = current;
    }
    print(arr);
  }

  linearSearch() {
    List arr = [1, 4, 5, 6, 7, 8, 9, 2, 0];

    int target = 9;
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        print(arr[i]);
        print(i);
      }
    }
  }

  int binarySearch() {
    List arr = [-1, 2, 3, 4, 9, 8, 9];
    int start = 0, end = arr.length - 1;
    int target = 8;

    while (start <= end) {
      int mid = int.parse((start + (end - start) / 2).toStringAsFixed(0));
      // 8 > 3
      if (target > arr[mid]) {
        start = mid + 1;
      } else if (target < arr[mid]) {
        end = mid - 1;
      } else {
        return mid;
      }
    }
    return -1;
  }

  void findMisisngElement() {
    List arr = [2, 3, 4, 5, 6, 7, 9];

    int actualLength = arr.length + 1;
    print("Actual Length : $actualLength");
    arr.sort();
    print(arr);
    int min = arr.first;
    print("min value : $min");

    int max = min + actualLength - 1;
    print("Max value : $max");

    int expectedSum = ((min + max) * actualLength) ~/ 2;

    print("Expected Sum  : $expectedSum");

    int actualSum = arr.reduce((sum, num) => sum + num);

    print("Actual Sum  : $actualSum");

    int missingNumber = expectedSum - actualSum;

    print("Missing Number : $missingNumber");
  }

  void largestSmallestElementInList() {
    List arr = [2, 3, 5, 1, 7, 9, 0];
    int firstLarge = arr[0];
    int smallestInt = arr[0];
    int secondLarge = arr[0];

    for (int i = 1; i < arr.length; i++) {
      // first largest
      if (arr[i] > firstLarge) {
        secondLarge = firstLarge;
        firstLarge = arr[i];
      }
      // second largest
      else if (arr[i] > secondLarge) {
        secondLarge = arr[i];
      }

      // smallest element
      else if (arr[i] < smallestInt) {
        smallestInt = arr[i];
      }
    }
    print("Largest number : $firstLarge");
    print("Smallest number : $smallestInt");
    print("Second Largest number : $secondLarge");
  }

  void duplicateElementList() {
    List arr = [1, 3, 5, 6, 1];

    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[i] == arr[j]) {
          if (kDebugMode) {
            print("Duplicate element is : ${arr[i]}");
          }

          arr.remove(arr[i]);
        }
      }
    }
    print("After remove duplicate element in the list is ");
    print(arr);
  }

  void searchRotatedSortedArray() {
    List arr = [4, 5, 6, 7, 0, 1, 2];
    int target = 1;
    int str = 0;
    int end = arr.length - 1;

    while (str <= end) {
      int mid = (str + (end - str)) ~/ 2;

      if (arr[str] <= arr[mid]) // left side
      {
        if (arr[str] <= target && target <= arr[mid]) {
          end = mid - 1;
        } else {
          str = mid + 1;
        }
      } else {
        // right side
        if (arr[mid] <= target && target <= arr[end]) {
          str = mid + 1;
        } else {
          end = mid - 1;
        }
      }
    }

    print(arr[target]);
  }

  void mergeTwoSortedArray() {
    List list1 = [1, 2, 3, 4, 5];
    List list2 = [2, 3, 4, 5, 6];
    List mergeList = [];
    int i = 0, j = 0;

    while (i < list1.length && j < list2.length) {
      print(list1[i]);
      print(list2[j]);
      if (list1[i] <= list2[j]) {
        mergeList.add(list1[i]);
        i++;
      } else {
        mergeList.add(list2[j]);
        j++;
      }
    }

    while (i < list1.length) {
      mergeList.add(list1[i++]);
    }
    while (j < list2.length) {
      mergeList.add(list2[j++]);
    }

    print(mergeList);
  }

  void mergeTwoSortedArray2() {
    List a = [1, 2, 3, 0, 0, 0];
    List b = [2, 5, 6];
    int aN = 3, bN = 3;
    int idx = (aN + bN) - 1;
    int ai = aN - 1;
    int bi = bN - 1;

    while (ai >= 0 && bi >= 0) {
      if (a[ai] >= b[bi]) {
        a[idx] = a[ai];
        ai--;
      } else {
        a[idx] = b[bi];
        bi--;
      }
      idx--;
    }

    while (bi >= 0) {
      a[idx] = b[bi];
      bi--;
      idx--;
    }

    print(a);
  }

  //Quick Sort ----------------------------------------------------------//
  void quickSort() {
    List arr = [3, 5, 1, 6, 2, 7, 9];
    quickSortPivot(arr, 0, arr.length - 1);
    print(arr);
  }

  void quickSortPivot(List arr, int st, int end) {
    if (st < end) {
      int pivotIdx = partition(arr, st, end);
      quickSortPivot(arr, st, pivotIdx - 1); //left side
      quickSortPivot(arr, pivotIdx + 1, end); // right side
    }
  }

  int partition(List arr, int st, int end) {
    int idx = st - 1, pivot = arr[end];

    for (int j = st; j < end; j++) {
      if (arr[j] <= pivot) {
        idx++;
        int temp = arr[idx];
        arr[idx] = arr[j];
        arr[j] = temp;
      }
    }
    idx++;
    int temp = arr[idx];
    arr[idx] = arr[end];
    arr[end] = temp;
    return idx;
  }
//Quick Sort ----------------------------------------------------------//

// Merge Sort ----------------------------------------------------//
  void mergeSortCustom() {
    List<int> arr = [4, 7, 2, 9, 3, 0, 6, 5];
    int n = arr.length;

    divide(arr, 0, n - 1);

    print("Sorted Array: $arr");
  }

  void divide(List<int> arr, int st, int end) {
    if (st >= end) return;

    int mid = st + (end - st) ~/ 2;

    divide(arr, st, mid);
    divide(arr, mid + 1, end);
    conquer(arr, st, mid, end);
  }

  void conquer(List<int> arr, int st, int mid, int end) {
    List<int> mergedList = [];

    int idx1 = st;
    int idx2 = mid + 1;

    while (idx1 <= mid && idx2 <= end) {
      if (arr[idx1] <= arr[idx2]) {
        mergedList.add(arr[idx1++]);
      } else {
        mergedList.add(arr[idx2++]);
      }
    }

    while (idx1 <= mid) {
      mergedList.add(arr[idx1++]);
    }
    while (idx2 <= end) {
      mergedList.add(arr[idx2++]);
    }

    for (int i = 0; i < mergedList.length; i++) {
      arr[st + i] = mergedList[i];
    }
  }

// Merge Sort ----------------------------------------------------//
}
