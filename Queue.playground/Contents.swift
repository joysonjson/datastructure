import UIKit

struct Queue<T> {
    private var data: [T] = []

    mutating func enqueue(_ element: T) {
        data.append(element)
    }

    mutating func dequeue()  -> T?{
        if (data.isEmpty) {
            return nil
        }
        return data.removeFirst()
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

// using 2 ques to reduce remove O(n) to O(1)


struct OptimisedQueue<T> {
    private var enqueData: [T] = []
    private var dequeData: [T] = []

    mutating func enqueue(_ element: T) {
        enqueData.append(element)
    }

    mutating func dequeue() -> T {
        if (dequeData.isEmpty) {
            dequeData = enqueData.reversed()
            enqueData.removeAll()

        }
        return dequeData.removeLast()
    }
}
extension OptimisedQueue : CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(enqueData.map{ $0 })"
    }
}

print("++++++++++++++++++++++++++++++")

var queue2 = OptimisedQueue<String>()
queue2.enqueue("Ray")
queue2.enqueue("Brian")
queue2.enqueue("Eric")
queue2.dequeue()

print(queue)
