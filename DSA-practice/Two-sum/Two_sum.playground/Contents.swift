import UIKit

func findTargetTwoSum(_ nums: [Int], target: Int) -> [Int] {
    var numsDict : [Int : Int] = [:]
    for (index, value) in nums.enumerated() {
        let temp = target - value
        if let previousIndex = numsDict[temp] {
            return [previousIndex, index]
        }
        
        numsDict[value] = index
    }
    return []
}

var result = findTargetTwoSum([2,9,15,5,4,2,5], target: 9)
