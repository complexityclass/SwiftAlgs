import Foundation

// Merge sort recursive

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

var list = [9,6,7,3,4,2,1,4,5,67,98,1]

mergeSort(list)