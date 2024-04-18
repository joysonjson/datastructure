import UIKit

/**
 ***Swift defines arrays using protocols.
 * The Swift Array is known as a generic collection, because it can work with any type.
 *
 */

//1. Array have rondom access
//2. Arrays are ordered
var people: [String] = []


// O(n) every other element position has to be shifted
people.insert("Andy", at: 0)

// O(1) if array is not reallocated to new meemory in RAM
people.append("Charles")


// Random acess both read and write O(1)

people[0] = "Ben"

print(people[0])


// we can iterate over an array because they confirm to sequence protocol
// we can subscript because it confirms to collection protocol


// Array initally given a memory if that exceeds the entire array is copied to a new location. in this case copying can be O(n) when it adds



/**
When you copy an array. it can be really expensive in terms of performance because you'll have to copy all the underlying data to another place in memory.
Trying to minimize the issue, the Swift Standard library implements this set of mechanisms for some value types such as Array,
where the value will be copied only upon mutation, Copy on write
 */


func print(address o: UnsafeRawPointer ) {
    print(String(format: "%p", Int(bitPattern: o)))
}

var array1: [Int] = [0, 1, 2, 3]
var array2 = array1

//Print with just assign
print(address: array1) //0x600001703ba0
print(address: array2) //0x600001703ba0

//Let's mutate array2 to see what's
array2.append(4)

print(address: array2) //0x60000260e9c0


