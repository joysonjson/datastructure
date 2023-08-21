import UIKit

/**
**A dictionary is another generic collection that holds key-value pairs. For example, here’s a dictionary containing a user’s name and a score:
*/

var scores: [String: Int] = ["Eric": 9, "Mark": 12, "Wayne": 1]

// MARK: - Dictionaries don’t have any guarantees of order, nor can you insert at a specific index.
// MARK: - They also put a requirement on the Key type that it be Hashable

// MARK: - Adding new key value O(1)
scores["Andrew"] = 0

// MARK: - Set
// MARK: - A set is a container that holds unique values. Imagine it being a bag that allows you to insert items into it, but rejects items that have already been inserted:
// MARK: -
// MARK: -

var bag: Set<String> = ["Candy", "Juice", "Gummy"]
bag.insert("Candy")
print(bag)

// Sets using hashing to insert a elemt into the set
// O(1)

/**
Every data structure has advantages and disadvantages. Knowing them is key to writing performant software.
Functions such as insert(at:) for Array have performance characteristics that can cripple performance when used haphazardly. If you find yourself needing to use insert(at:) frequently with indices near the beginning of the array, you may want to consider a different data structure such as the linked list.
Dictionary trades away the ability to maintain the order of its elements for fast insertion and searching.
Set guarantees uniqueness in a collection of values. Set is optimized for speed and abandons the ability to retain the order of the elements.
The Swift Collections package contains specialized data structures that perform better in certain scenarios.
 */
