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
