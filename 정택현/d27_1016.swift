// MARK: - 프렌즈4블록
// https://programmers.co.kr/learn/courses/30/lessons/17679

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var b = [[String]]()
    var erase: [(row:Int,col:Int)] = [(0,0)]
    for str in board {
        b.append(Array(str).map{String($0)})
    }
    
    func game(row: Int, col: Int) -> Bool  {
        if b[row][col] == " " { return false }
        if row+1 >= m || col+1 >= n { return false }
        let arr = [b[row][col],b[row][col+1],b[row+1][col],b[row+1][col+1]]
        return Set(arr).count == 1 ? true : false
    }
    func delete(row: Int, col: Int) {
        b[row][col] = " "
        b[row][col+1] = " "
        b[row+1][col] = " "
        b[row+1][col+1] = " "
    }
    func move(row: Int col: Int) {
        if row+1 >= m  { return }
        if b[row+1][col] == " " {
            b[row+1][col] = b[row][col]
            b[row][col] = " "
            move(row: row+1, col: col)
        }else {
            return
        }
    }
    
    while !erase.isEmpty {
        erase = [(row:Int,col:Int)]()
        
        for row in 0..<m {
            for col in 0..<n {
                if game(row: row, col: col) {
                    erase.append((row,col))
                }
            }
        }
        
        for tuple in erase {
            delete(row: tuple.row, col: tuple.col)
        }
      
        for row in (0..<m).reversed() {
            for col in (0..<n).reversed(){
                move(row: row, col: col)
            }
        }
     
    }
    
    var num = 0
    for str in b {
        num += str.filter{$0 == " "}.count
    }
    
    
    return num
}
