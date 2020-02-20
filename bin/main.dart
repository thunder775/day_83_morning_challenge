//  Given two singly linked lists that intersect at some point, find the intersecting node.
//  The lists are non-cyclical.
//
//  For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return
//  the node with value 8.
//
//  In this example, assume nodes with the same value are the exact same
//  node objects.

import 'dart:math';

import 'package:test/test.dart';

class Node {
  int val;
  Node next;

  Node(this.val);
}

/// O(n*m)
//Node getIntersectingNode(Node A, Node B) {
//  Node temp1 = A;
//  Node temp2 = B;
//  while (temp1.next != null) {
//    while (temp2.next != null) {
//      if (temp1.val == temp2.val) {
//        return temp1;
//      }
//      temp2 = temp2.next;
//    }
//    temp1 = temp1.next;
//    temp2 = B;
//  }
//  return null;
//}
/// O(n+m)(using list)
//Node getIntersectingNode(Node A, Node B) {
//  List temp1 = [];
//  List temp2 = [];
//  Node a = A;
//  Node b = B;
//  while (true) {
//    temp1.add(a.val);
//    if (a.next == null) {
//      break;
//    }
//    a = a.next;
//  }
//  while (true) {
//    temp2.add(b.val);
//    if (b.next == null) {
//      break;
//    }
//    b = b.next;
//  }
//  print(temp1);
//  print(temp2);
//  int intersectingNodeVal = 0;
//  if (temp2.last != temp1.last) {
//    return null;
//  } else {
//    int len = temp1.length <= temp2.length ? temp1.length : temp2.length;
//    for (int i = 1; i <= len; i++) {
//      if (temp1[temp1.length - i] == temp2[temp2.length - i]) {
//        continue;
//      } else {
//        intersectingNodeVal = temp1[temp1.length - (i - 1)];
//        break;
//      }
//    }
//  }
//  a = A;
//  while (true) {
//    if (a.val == intersectingNodeVal) {
//      return a;
//    }
//    a = a.next;
//  }
//}
int getNodeLength(Node node) {
  int nodeLength = 0;
  while (node != null) {
    nodeLength++;
    node = node.next;
  }
  return nodeLength;
}

/// O(m+n) without list
Node getIntersectingNode(Node node1, Node node2) {
  int lengthA = 0;
  int lengthB = 0;
  Node tempNode1 = node1;
  Node tempNode2 = node2;
  lengthA = getNodeLength(tempNode1);
  lengthB = getNodeLength(tempNode2);
  node2 = getPointerToSamePosition(lengthB, lengthA, node2);
  node1 = getPointerToSamePosition(lengthA, lengthB, node1);
  while (node1 != null) {
    if (node1.val == node2.val) {
      return node1;
    }
    node1 = node1.next;
    node2 = node2.next;
  }
}

Node getPointerToSamePosition(int lengthA, int lengthB, Node node) {
  if (lengthA >= lengthB) {
    for (int i = 0; i < lengthA - lengthB; i++) {
      node = node.next;
    }
  }
  return node;
}

void main() {
  Node x = Node(111);
  Node a = Node(3);
  Node b = Node(7);
  Node c = Node(8);
  Node d = Node(10);
  Node e = Node(99);
  Node f = Node(1);
  // A list
  x.next = a;
  a.next = b;
  b.next = c;
  c.next = d;
  // B list
  e.next = f;
  f.next = c;
  // print(d.next);
  print(getIntersectingNode(x, e).val);
}
