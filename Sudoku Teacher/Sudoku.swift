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
    
    init(array: [[Int]]) {
        self.rows = array
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
                if self.rows[j][i] != 0 {
                    self.allowed[i*10+j] = Set<Int>()
                }
                else {
                    self.allowed[i*10+j] = nums
                }
            }
        }
    }
    
    func copy() -> Sudoku {
        let new_game = Sudoku(array: self.rows)
        return new_game
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
    
    func assign_domains() {
        for i in 0...8 {
            for j in 0...8 {
                if self.rows[j][i] == 0 {
                    let row = self.rows[j]
                    let col = self.cols[i]
                    let n = Int(floor(Double(j)/3.0))
                    let m = Int(floor(Double(i)/3.0))
                    let a = n*3+m
                    let square = self.squares[a]
                    var remove = [Int]()
                    for num in row {
                        if !remove.contains(num) && num != 0 {
                            remove.append(num)
                        }
                    }
                    for num in col {
                        if !remove.contains(num) && num != 0 {
                            remove.append(num)
                        }
                    }
                    for num in square {
                        if !remove.contains(num) && num != 0 {
                            remove.append(num)
                        }
                    }
                    let allowed = self.allowed[i*10+j]!
                    var new_allowed = Set<Int>()
                    if allowed.count != 0 {
                        for num in allowed {
                            if !remove.contains(num) {
                                new_allowed.insert(num)
                            }
                        }
                    }
                    if new_allowed.count == 1 {
                        // explanation!!!!!!
                        self.add_number(pos: [i, j], num: Array(new_allowed)[0])
                    }
                    else {
                        self.allowed[i*10+j] = new_allowed
                    }
                }
            }
        }
    }
    func check_squares() {
        for a in 0...8 {
            for num in 1...9 {
                if !self.squares[a].contains(num) {
                    var spots = 0
                    var spot = [Int]()
                    for b in 0...8 {
                        let pos = self.pos_from_square(square: a, index: b)
                        let i = pos[0]
                        let j = pos[1]
                        if self.allowed[i*10+j]!.contains(num) {
                            spots += 1
                            spot = pos
                        }
                    }
                    if spots == 1 {
                        let i = spot[0]
                        let j = spot[1]
                        self.add_number(pos: spot, num: num)
                        self.allowed[i*10+j] = Set<Int>()
                    }
                }
            }
        }
    }
    func check_rows() {
        for j in 0...8 {
            for num in 1...9 {
                if !self.rows[j].contains(num) {
                    var spots = 0
                    var spot = [Int]()
                    for i in 0...8 {
                        if self.allowed[i*10+j]!.contains(num) {
                            spots += 1
                            spot = [i, j]
                        }
                    }
                    if spots == 1 {
                        let i = spot[0]
                        let j = spot[1]
                        self.add_number(pos: spot, num: num)
                        self.allowed[i*10+j] = Set<Int>()
                    }
                }
            }
        }
    }
    func check_cols() {
        for i in 0...8 {
            for num in 1...9 {
                if !self.cols[i].contains(num) {
                    var spots = 0
                    var spot = [Int]()
                    for j in 0...8 {
                        if self.allowed[i*10+j]!.contains(num) {
                            spots += 1
                            spot = [i, j]
                        }
                    }
                    if spots == 1 {
                        let i = spot[0]
                        let j = spot[1]
                        self.add_number(pos: spot, num: num)
                        self.allowed[i*10+j] = Set<Int>()
                    }
                }
            }
        }
    }
    func check_blocked_cols() {
        for a in 0...8 {
            var missing_numbers = [Int]()
            for x in 1...9 {
                if !self.squares[a].contains(x) {
                    missing_numbers.append(x)
                }
            }
            for missing in missing_numbers {
                var cols_allowed = Set<Int>()
                for b in 0...8 {
                    let pos = self.pos_from_square(square: a, index: b)
                    let i = pos[0]
                    let j = pos[1]
                    if self.allowed[i+10+j] != nil {
                        if self.allowed[i+10+j]!.contains(missing) {
                            cols_allowed.insert(j)
                        }
                    }
                }
                if cols_allowed.count == 1 {
                    let j = Array(cols_allowed)[0]
                    for i in 0...8 {
                        let returned = self.square_from_pos(pos: [i, j])
                        let square = returned[0]
                        if self.allowed[i*10+j] != nil {
                            if square != a && self.allowed[i*10+j]!.contains(missing) {
                                self.allowed[i*10+j]!.remove(missing)
                            }
                        }
                    }
                }
            }
        }
    }
    func check_blocked_rows() {
        for a in 0...8 {
            var missing_numbers = [Int]()
            for x in 1...9 {
                if !self.squares[a].contains(x) {
                    missing_numbers.append(x)
                }
            }
            for missing in missing_numbers {
                var rows_allowed = Set<Int>()
                for b in 0...8 {
                    let pos = self.pos_from_square(square: a, index: b)
                    let i = pos[0]
                    let j = pos[1]
                    if self.allowed[i+10+j] != nil {
                        if self.allowed[i+10+j]!.contains(missing) {
                            rows_allowed.insert(i)
                        }
                    }
                }
                if rows_allowed.count == 1 {
                    let i = Array(rows_allowed)[0]
                    for j in 0...8 {
                        let returned = self.square_from_pos(pos: [i, j])
                        let square = returned[0]
                        if self.allowed[i*10+j] != nil {
                            if square != a && self.allowed[i*10+j]!.contains(missing) {
                                self.allowed[i*10+j]!.remove(missing)
                            }
                        }
                    }
                }
            }
        }
    }
    func solve() -> (Bool, [[Int]]) {
        // base case - unsolvable
        if self.unsolvable() {
            return (false, [[Int]]())
        }
        // check for rules
        var prev = self.rows
        var finding = true
        while finding {
            self.assign_domains()
            self.check_squares()
            self.check_rows()
            self.check_cols()
            self.check_blocked_cols()
            self.check_blocked_rows()
            if prev == self.rows {
                finding = false
            }
            prev = self.rows
        }
        // return if solved
        var solved = true
        for i in 0...8 {
            for j in 0...8 {
                if self.rows[j][i] == 0 {
                    solved = false
                }
            }
        }
        if solved {
            return (true, self.rows)
        }
        else {
            return (false, [[Int]]())
        }
    }
}
