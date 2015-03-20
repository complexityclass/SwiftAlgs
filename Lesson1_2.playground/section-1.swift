// Playground - noun: a place where people can play

import UIKit


func binarySearch(key: Int, list: [Int], low: Int, high: Int) -> Int? {
    
    assert(list.count > 0)
    
    if high < low {
        return nil
        
    } else {
        
        var mid = low + (high - low) / 2
        
        if (key > list[mid]) {
            return binarySearch(key, list, mid + 1, high)
            
        }else if key < list[mid] {
            return binarySearch(key, list, low, mid - 1)
            
        } else {
            return mid
        }
    }
}

binarySearch(6, [1,2,3,4,5,6,7,8,9,10], 0, 9)

