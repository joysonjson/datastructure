import UIKit

struct Queue<T> {
    private var data: [T] = []

    mutating func enqueue(_ element: T) {
        data.append(element)
    }

    mutating func dequeue() {
        if (data.isEmpty) {
            return
        }
        data.removeFirst()
    }
}
extension Queue : CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(data.map{ $0 })"
    }
}

var queue = Queue<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue.dequeue()

print(queue)

