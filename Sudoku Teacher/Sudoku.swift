//
//  Sudoku.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 1/30/20.
//  Copyright © 2020 Viktoriya Tabunshchyk. All rights reserved.
//

import Foundation

class Sudoku {
    var rows: [[Int]]
    var cols: [[Int]]
    var squares: [[Int]]
    var allowed: [Int: Set<Int>]
    init() {
        self.rows = []
        for _ in 1...9 {
            self.rows.append(Array(repeating: 0, count: 9))
        }
        self.cols = [[],[],[],[],[],[],[],[],[]]
        for i in 0...8 {
            for j in 0...8 {
                self.cols[j].append(self.rows[i][j])
            }
        }
        self.squares = [[],[],[],[],[],[],[],[],[]]
        for i in 0...8 {
            for j in 0...8 {
                let n = floor(Double(j)/3.0)
                let m = floor(Double(i)/3.0)
                let index = n*3+m
                self.squares[Int(index)].append(self.rows[j][i])
            }
        }
        self.allowed = [Int: Set<Int>]()
        let nums: Set = [1,2,3,4,5,6,7,8,9]
        for i in 0...8 {
            for j in 0...8 {
                self.allowed[i*10+j] = nums
            }
        }
    }
    
    func pos_from_square(square: Int, index: Int) -> [Int] {
        let min_row = Int(floor(Double(square)/3.0))*3
        let min_col = (square%3)*3
        let add_col = Int(floor(Double(index)/3.0))
        let add_row = index%3
        return [min_col + add_col, min_row + add_row]
    }
    
    func square_from_pos(pos: [Int]) -> [Int] {
        let i = pos[0]
        let j = pos[1]
        let n = Int(floor(Double(j)/3.0))
        let m = Int(floor(Double(i)/3.0))
        let a = n*3+m
        let b = (i%3)*3 + (j%3)
        return [a, b]
    }
    
    func add_number(pos: [Int], num: Int) {
        let i = pos[0]
        let j = pos[1]
        self.rows[j][i] = num
        self.cols[i][j] = num
        let square = self.square_from_pos(pos: [i, j])
        let a = square[0]
        let b = square[1]
        self.squares[a][b] = num
    }
    
    func unsolvable() -> Bool {
        for (pos, _) in self.allowed {
            let i = Int(floor(Double(pos)/10.0))
            let j = pos%10
            if (self.allowed[pos])!.count == 0 && self.rows[j][i] == 0 {
                return true
            }
        }
        return false
    }
    
    func breaks_rule(pos: [Int], num: Int) -> Bool {
        let i = pos[0]
        let j = pos[1]
        if self.rows[j].contains(num) {
            return true
        }
        if self.cols[i].contains(num) {
            return true
        }
        let ab = square_from_pos(pos: [i, j])
        let a = ab[0]
        if self.squares[a].contains(num) {
            return true
        }
        return false
    }
}
