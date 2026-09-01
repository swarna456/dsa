import UIKit

// LeetCode-242 : Valid Anagram
// Given two strings s and t, return true if t is an anagram of s, otherwise return false.

// Solution 1: Simple solution for understanding

// Time: O(n log n)
// Space: O(n)
func isAnagram(_ s: String, _ t: String) -> Bool {
    
    // Step 1: Convert both strings into Character arrays
    var sArray: [Character] = []
    var tArray: [Character] = []
    
    for char in s {
        sArray.append(char)
    }
    
    for char in t {
        tArray.append(char)
    }
    
    // Step 2: If the character counts are different,both strings cannot be anagrams
    if sArray.count != tArray.count {
        return false
    }
    
    // Step 3: Sort both arrays and compare them. Anagrams will have the same characters after sorting.
    if sArray.sorted() == tArray.sorted() {
        return true
    }

    return false
}


let result = isAnagram("anagram", "nagaram")
print(result)


// Solution 2: HashMap / Frequency Count

// Optimized approach
// Time: O(n)
// Space: O(n)

func isAnagramOptimized(_ s: String, _ t: String) -> Bool {
    
    // Step 1: If both strings have different lengths, they cannot be anagrams
    if s.count != t.count {
        return false
    }
    
    // Step 2: Store the count of each character from string s
    var characterCount: [Character: Int] = [:]
    
    for char in s {
        characterCount[char, default: 0] += 1
    }
    
    // Step 3: Reduce the count for each character from string t
    for char in t {
        characterCount[char, default: 0] -= 1
        
        // Remove the character when its count becomes zero
        if characterCount[char] == 0 {
            characterCount[char] = nil
        }
    }
    
    // Step 4: If the dictionary is empty, both strings are anagrams
    return characterCount.isEmpty
}

let resultOptimized = isAnagramOptimized("anagrap", "nagaram")
print(resultOptimized)
