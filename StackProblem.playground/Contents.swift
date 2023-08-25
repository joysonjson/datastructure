import UIKit


// MARK: Challenge 1: Reverse an Array
// MARK: Create a function that uses a stack to print the contents of an array in reversed order.

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

func printInReverse<T>(_ array: [T]) {
  var stack = Stack<T>()

  for value in array {
    stack.push(value)
  }

  while let value = stack.pop() {
    print(value)
  }
}


printInReverse([1,2,3,4])


// MARK: Challenge 2: Balance the parentheses
// MARK: Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:

/**
 // 1
 h((e))llo(world)() // balanced parentheses

 // 2
 (hello world // unbalanced parentheses

 */

func checkBalenced(_ string: String) -> Bool {
  var stack = Stack<Character>()

  for character in string {
    if character == "(" {
      stack.push(character)
    } else if character == ")" {
      if stack.isEmpty {
        return false
      } else {
        stack.pop()
      }
    }
  }
  return stack.isEmpty
}

let balenced = checkBalenced("h((e))llo(world)()])((")
print(balenced)
