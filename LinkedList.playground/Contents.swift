import UIKit

/**Linked Lists
 Written by Kelvin Lau
 A linked list is a collection of values arranged in a linear, unidirectional sequence. A linked list has some theoretical advantages over contiguous storage options such as the Swift Array:
 Constant time insertion and removal from the front of the list.
 Reliable performance characteristics.
 */


// TODO: As the diagram suggests, a linked list is a chain of nodes. Nodes have two responsibilities:
// MARK: Hold a value.
// MARK: Hold a reference to the next node. A nil value represents the end of the list.


public class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

public struct LinkedList<Value> {

  public var head: Node<Value>?
  public var tail: Node<Value>?

  public init() {}

  public var isEmpty: Bool {
    head == nil
  }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}


//MARK: push operations
// Adding a value at the front of the list is known as a push operation. This is also known as head-first insertion. The code for it is deliciously simple.

extension LinkedList {
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)

//MARK: append operations
//The next operation you’ll look at is append. This adds a value at the end of the list, known as tail-end insertion.

extension LinkedList {
    public mutating func append(_ value: Value) {
      guard !isEmpty else {
        push(value)
        return
      }
      tail!.next = Node(value: value)
      tail = tail!.next
    }

}

var list2 = LinkedList<Int>()
list2.append(1)
list2.append(2)
list2.append(3)

print(list)


// MARK: insert(after:) operations
// The third and final operation for adding values is insert(after:). This operation inserts a value at a particular place in the list and requires two steps

// TODO: 1. Finding a particular node in the list.
// TODO: 2. Inserting the new node.

extension LinkedList {
    
    public func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}

var list3 = LinkedList<Int>()
list3.push(3)
list3.push(2)
list3.push(1)

print("Before inserting: \(list3)")
var middleNode = list3.node(at: 0)!

list3.insert(-1, after: middleNode)

print("list 3",list3)
