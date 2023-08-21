import UIKit

var greeting = "Hello, playground"

/**
Limiting the interface to these two operations means that you can only add or remove elements from one side of the data
structure. In computer science, a stack is known as a LIFO (last-in-first-out) data structure. Elements that are pushed in last are the first ones to be popped out.
 */

// **Stacks are used prominently in all disciplines of programming. To list a few:
// MARK: - iOS uses the navigation stack to push and pop view controllers into and out of view.
// MARK: - Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack.
// MARK: - Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.


public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    public func peek() -> Element? {
        storage.last
    }

    public var isEmpty: Bool {
      peek() == nil
    }
}

extension Stack: CustomDebugStringConvertible {
  public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
}

extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}


var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print(stack)

if let poppedElement = stack.pop() {
    assert(4 == poppedElement)
    print("Popped: \(poppedElement)")
}

var stack2: Stack = [1.0, 2.0, 3.0, 4.0]
 print(stack2)
 stack2.pop()
