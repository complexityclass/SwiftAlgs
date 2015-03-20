// Playground - noun: a place where people can play

import UIKit

//1 Определить асимптотику  O(?)

//1.0
var test = 0
var n = 100

/*for i in 0...n {
    for j in 0...n {
        test = test * i * j
    }
}*/

// 1.1
/*for i in 0...n {
    test = test + i
}

for j in 0...n {
    test = test + j
}*/

// 1.2

var temp = 0
var i = n

while i > 0 {
    temp = 5 + 7
    i = i / 2
}

//2 Определить асимптотику работы алгоритма определения анаграмм с генерацией всех 
//возможных строк из cтроки s2 и поиска среди них s1


//3 Рекурсивный разворот строки

func reverseString(str: String) -> String {
    return ""
}


//4 Определить проблему в коде

func rec(n: Int) -> String {
    var s = "\(rec(n - 3))" + "\(rec(n - 2))"
    if n <= 0 {
        return ""
    }
    return s
}

//5 Написать рекурсивный вариант бинарного поиска


//6 Разобраться с хвостовой рекурсией. Оптимизирует ли ее Swift ?













