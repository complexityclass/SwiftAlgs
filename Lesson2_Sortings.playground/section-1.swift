// Playground - noun: a place where people can play

import UIKit

var list = [9,6,7,3,42,2,78,4,5,67,98,1]


func quickSort<T: Comparable>(inout list:[T], start: Int, end: Int) {
    if end - start < 2 {
        return
    }
    
    var pivot = list[start + (end - start) / 2]
    var low = start
    var high = end - 1
    
    while(low <= high) {
        if list[low] < pivot {
            low += 1
            continue
        }
        
        if list[high] > pivot {
            high -= 1
            continue
        }
        
        let temp = list[low]
        list[low] = list[high]
        list[high] = temp
        
        low++
        high--
    }
    
    quickSort(&list, start, high + 1)
    quickSort(&list, high + 1, end)
}


quickSort(&list, 0, list.count)













