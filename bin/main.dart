//  Given two singly linked lists that intersect at some point, find the intersecting node.
//  The lists are non-cyclical.
//
//  For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return
//  the node with value 8.
//
//  In this example, assume nodes with the same value are the exact same
//  node objects.

class Node {
  int val;
  Node next;

  Node(this.val);
}

Node getIntersectingNode(Node A, Node B) {
  Node temp1 = A;
  Node temp2 = B;
  while (temp1.next != null) {
    while (temp2.next != null) {
      if (temp1.val == temp2.val) {
        return temp1;
      }
      temp2 = temp2.next;
    }
    temp1 = temp1.next;
    temp2 = B;
  }
  return null;
}

void main() {
  Node a = Node(3);
  Node b = Node(7);
  Node c = Node(8);
  Node d = Node(10);
  Node e = Node(99);
  Node f = Node(1);
  // A list
  a.next = b;
  b.next = c;
  c.next = d;
  // B list
  e.next = f;
  f.next = c;
  // print(d.next);
  print(getIntersectingNode(a, e).val);
}
