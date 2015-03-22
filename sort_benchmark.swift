//
//  Sorter.swift
//  Sortings
//
//  Created by Valeriy Popov on 22/03/15.
//  Copyright (c) 2015 Valeriy Popov. All rights reserved.
//

import Foundation

class Sorter {
    
    var list = [9,6,7,3,42,2,78,4,5,67,98,1]
    
    func bubbleSort<T: Comparable>(inout list: [T]) -> [T] {
        
        let size = list.count
        
        for i in 0..<size {
            var pass = (size - 1) - i
            
            for j in 0..<pass {
                var key = list[j]
                
                if(key > list[j + 1]) {
                    let temp = list[j + 1]
                    list[j + 1] = key
                    list[j] = temp
                }
                
            }
        }
        
        return list
    }
    
    func countingSort(inlist: [Int], maxVal : Int) -> [Int] {
        let size = inlist.count
        let m = maxVal + 1
        var container = [Int](count: m, repeatedValue: 0)
        
        for j in inlist {
            container[j] += 1
        }
        
        var i = 0
        var outer = [Int](count: size, repeatedValue: 0)
        for a in 0..<m {
            for c in 0..<container[a]{
                outer[i] = a
                i += 1
            }
        }
        
        return outer
    }
    
    func merge<T: Comparable>(list1: [T], list2: [T]) -> [T] {
        if list1.count == 0 {
            return list2
            
        } else if list2.count == 0 {
            return list1
            
        } else if list1[0] < list2[0] {
            return [list1[0]] + merge(Array(list1[1..<list1.count]), list2: list2)
        }else {
            return [list2[0]] + merge(list1, list2: Array(list2[1..<list2.count]))
        }
    }
    
    func mergeSort<T:Comparable>(list: [T]) -> [T] {
        if list.count < 2 {
            return list
        } else {
            let half = Int(list.count / 2)
            return merge(mergeSort(Array(list[0..<half])), list2: mergeSort(Array(list[half..<list.count])))
        }
    }
    
    func quickSort<T: Comparable>(inout list:[T], start: Int, end: Int) -> [T] {
        if end - start < 2 {
            return list
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
        
        quickSort(&list, start: start, end: high + 1)
        quickSort(&list, start: high + 1, end: end)
        
        return []
    }
    
    
    func timeElapsedInSecondsWhenRunningCode(operation:()->(AnyObject)) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        return Double(timeElapsed)
    }

    
    func test(){
        
        createArray(5000)
        
        let arr1 = self.list
        var arr2 = arr1
        var arr3 = arr2
        var arr4 = arr3
        
        let numMax = self.list.reduce(Int.min, combine: {max($0, $1) })
        
        let merged  = timeElapsedInSecondsWhenRunningCode { self.mergeSort(arr1) }
        let bubbled = timeElapsedInSecondsWhenRunningCode { self.bubbleSort(&arr2)}
        let quickSorted = timeElapsedInSecondsWhenRunningCode { self.quickSort(&arr3, start: 0, end: arr3.count)}
        let counted = timeElapsedInSecondsWhenRunningCode { self.countingSort(arr4, maxVal: numMax)}
        let swifted = timeElapsedInSecondsWhenRunningCode { self.list.sort { $0 < $1}
        return 6}
        
        
        println("bubble     = \(bubbled)")
        println("merge      = \(merged)")
        println("quickSort  = \(quickSorted)")
        println("counting   = \(counted)")
        
        println("swift      = \(swifted)")
        
    }
    
    func createArray(n: Int){
        for i in 1..<n {
            self.list.append(i)
        }
        
        self.list.shuffle()
    }
    
    
}

extension Array {
    
    mutating func shuffle() {
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
