
O(g(n)) = Сущ c и n0 : 0 <= f(n) <= ch(n) для всех n >= n0

//1 const
// logn логарифмическая
// n Линейная
//nLogn Линейно-логарифмическая
//n^2 Квадратичная 
// n^3 кубическая 
// 2^n Экспоненциальная

// O(1) const
// O(logn) 
// O(n)
// O(nlogn)
// O(n^2)
// O(n^3) 
// O(2^n) 


//Анаграммы

func anagramCountSol(str1: String, str2: String) -> Bool {
    
    var counter1 = [Int](count: 28, repeatedValue: 0)
    var counter2 = [Int](count: 28, repeatedValue: 0)
    
    var aPos = 97
    
    for ch in str1.unicodeScalars {
        var pos = Int(ch.value - aPos)
        counter1[pos] = counter1[pos] + 1
    }
    
    for ch in str2.unicodeScalars {
        var pos = Int(ch.value - aPos)
        counter2[pos] = counter2[pos] + 1
    }
    
    var j = 0
    var matched = true
    
    while j < 28 && matched {
        if counter1[j] == counter2[j] {
            j++
        } else {
            matched = false
        }
    }

    
    return matched
}


func anagramSolution1(str1: String, str2: String) -> Bool {
    
    var list1 = Array(str1)
    var list2 = Array(str2)
    
    list1.sort({$0 < $1})
    list2.sort({$0 < $1})
    
    var position = 0
    var matches = true
    
    while position < list1.count && matches {
        if list1[position] == list2[position]{
            position++
        }else {
            matches = false
        }
    }
    
    return matches
}




//Рекурсия 

func listSum(numList: [Int]) -> Int {
    let size = numList.count
    assert(size > 0)
    var sum = 0
    for num in numList {
        sum += num
    }
    
    return sum
}


func listSum(numList: [Int]) -> Int {
    let size = numList.count
    assert(size > 0)
    return size == 1 ? numList.first! : numList.first! + listSum(Array(numList[1..<size]))
}

func numToStringConverter(num: Int, base: Int) -> String {
    
    let numbers = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
    if(num < base){
        return numbers[num]
    } else {
        return numToStringConverter(num / base, base) + numbers[num % base]
    }
}


// Бинарный поиск

func search(key: Int, list: [Int]) -> Int? {
    
    for i in 0..<list.count {
        if list[i] == key {
            return i
        }
    }
    
    return nil
}

let list = [1,2,3,4,5,6,7,8,9,10,11,12,45,56]
search(8, list)


func binarySearch(key: Int, list: [Int]) -> Int? {
    
    var low = 0
    var high = list.count - 1
    
    while low <= high {
        
        var mid = low + (high - low) / 2
        if key < list[mid] {
            high = mid - 1
        }
        else if key > list[mid]{
            low = mid + 1
        } else {
            return mid
        }
    }
    
    return nil
}

//1 Определить асимптотику

var test = 0
var n = 100

for i in 0...n {
    for j in 0...n {
        test = test * i * j
    }
}

//
for i in 0...n {
    test = test + i
}

for j in 0...n {
    test = test + j
}

//

var temp = 0
var i = n

while i > 0 {
    temp = 5 + 7
    i = i / 2
}
//

//2. Анаграммы полный перебор ?


//4. Написать рекурсивный разворот строки

func reverseString(str: String) -> String {
    if(str.utf16Count == 0){
        return str
        
    } else {
        let secondIndex = advance(str.startIndex, 1)
        let range = str.startIndex..<secondIndex
        
        return reverseString(str.substringFromIndex(secondIndex)) + str.substringWithRange(range)
    }
}

//3. Какая проблема в след рекурсии

func rec(n: Int) -> String {
    var s = "\(rec(n - 3))" + "\(rec(n - 2))"
    if n <= 0 {
        return ""
    }   
    return s
}

