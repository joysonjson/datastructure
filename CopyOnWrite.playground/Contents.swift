import UIKit
import Foundation

final class Ref<T> {
  var val: T
  init(_ v: T) { val = v }
}

struct Box<T> {
  var ref: Ref<T>
  init(_ x: T) { ref = Ref(x) }

  var value: T {
    get { return ref.val }
    set {
      if !isKnownUniquelyReferenced(&ref) {
        ref = Ref(newValue)
        return
      }
      ref.val = newValue
    }
  }
}



var p1 = Box(1)

var p2 = p1

print(String(format: "%p",p1.value)) //0x1

print(String(format: "%p",p2.value)) //0x1

p2.value = 20

print(String(format: "%p",p2.value)) //0x14


