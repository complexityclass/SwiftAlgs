import Foundation
// Playground - noun: a place where people can play

import UIKit

//сортировка подсчетом

//n - входные элементы (0, k)
//k = O(n) --> t  O(n)
//Для каждого входного эелемента определить количестов элементов меньших x

//n - (0,k) => k = O(n) => O(n)
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


//сортировки сравнением

//пузырек

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

//Divide and conquer

//Разделение : задачи на несколько подзадач
// Покорение: рекурсивное решение подзадач
// Комбинирование : решение исходное задачи исходя из решения подзадач

// divide  : O(1)
// conquer : T(n) = > 2 * T(n/2)
// combine :  O(n)

//[1,4,5]  [2,6,7, 9]

//сортировка слиянием
func merge<T: Comparable>(list1: [T], list2: [T]) -> [T] {
    if list1.count == 0 {
        return list2
    
    } else if list2.count == 0 {
        return list1
    
    } else if list1[0] < list2[0] {
        return [list1[0]] + merge(Array(list1[1..<list1.count]), list2)
    }else {
        return [list2[0]] + merge(list1, Array(list2[1..<list2.count]))
    }
}


func mergeSort<T:Comparable>(list: [T]) -> [T] {
    if list.count < 2 {
        return list
    } else {
        let half = Int(list.count / 2)
        return merge(mergeSort(Array(list[0..<half])), mergeSort(Array(list[half..<list.count])))
    }
}

var list = [9,6,7,3,42,2,78,4,5,67,98,1]
//mergeSort(list)

//countingSort(list, 99)


// quick sort

func quickSort<T: Comparable>(data: [T]) -> [T] {
    if data.count > 1{
        var less:[T]    = []
        var equal:[T]   = []
        var greater:[T] = []
        
        var pivot = data[1]
        for x in data{
            if x < pivot {
                less.append(x)
            } else if x == pivot {
                equal.append(x)
            } else {
                greater.append(x)
            }
        }
        
        return quickSort(less) + equal + quickSort(greater)
    } else {
        return data
    }
}

func quickSort<T: Comparable>(list: [T]) -> [T] {
    
    if list.count == 0 {
        return []
    }
    
    let pivot = list[0]
    let subList = list.count > 1 ? list[1..<list.count] : []
    let smaller = filter(subList, {$0 <= pivot})
    let greater = filter(subList, {$0 > pivot})
    
    return quickSort(smaller) + [pivot] + quickSort(greater)
    
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



















