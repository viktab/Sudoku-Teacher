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
    var guesses: [[[Int]]]
    var start_grid: [[Int]]
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
        self.guesses = []
        self.start_grid = []
    }
    init(difficulty: String) {
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
        self.guesses = []
        self.start_grid = []
        self.randomize_grid(pos: [0, 0])
        self.make_game(difficulty: difficulty)
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
        self.guesses = []
        self.start_grid = []
    }
    
    func randomize_grid(pos: [Int]) -> Bool {
        
        let i = pos[0]
        let j = pos[1]
        
        // base case: finished making the grid
        if (j == 9) {
            return true
        }
        
        var nums: Set = [1,2,3,4,5,6,7,8,9]
        
        // try to place a random number until there's no options left
        while (!nums.isEmpty) {
            let num = nums.randomElement()!
            if (!breaks_rule(pos: [i, j], num: num)) {
                self.add_number(pos: pos, num: num)
                var new_pos = [i, j]
                if (i < 8) {
                    new_pos = [i+1, j]
                } else {
                    new_pos = [0, j+1]
                }
                // recurse
                if (randomize_grid(pos: new_pos)) {
                    return true
                // backtrack
                } else {
                    self.add_number(pos: pos, num: 0)
                    nums.remove(num)
                }
            } else {
                nums.remove(num)
            }
        }
        // couldn't place any number so return false
        return false
    }
    
    func make_game(difficulty: String) {
        let hard: Set = [17, 18, 19]
        let medium: Set = [26, 27, 28, 29]
        let easy: Set = [34, 35, 36, 37]
        var to_remove = 0
        if (difficulty == "easy") {
            to_remove = 81 - easy.randomElement()!
        } else if (difficulty == "medium") {
            to_remove = 81 - medium.randomElement()!
        } else if (difficulty == "hard") {
            to_remove = 81 - hard.randomElement()!
        }
        
        var removed = 0
        while (removed < to_remove) {
            // pick random number to delete
            let pos = get_random_pos()
            let num = self.rows[pos[0]][pos[1]]
            self.add_number(pos: pos, num: 0)
            
            // check how many solutions there are now
            let game = self.copy()
            let solutions = game.count_solutions(count: 0)
            
            // if there's multiple solutions, put the number back
            if (solutions > 1) {
                self.add_number(pos: pos, num: num)
            } else {
                removed += 1
            }
        }
    }
    
    func count_solutions(count: Int) -> Int {
        let pos = self.get_next_pos()
        
        // base case: finished making the grid
        if (pos == [-1,-1]) {
            return count + 1
        }
        
        var my_count = count
        for num in 1...9 {
            if (!self.breaks_rule(pos: pos, num: num)) {
                self.add_number(pos: pos, num: num)
                // recurse
                let new_count = self.count_solutions(count: my_count)
                // backtrack if didn't find any new solutions
                if (new_count == my_count) {
                    self.add_number(pos: pos, num: 0)
                }
                my_count = new_count
            }
        }
        
        return my_count
    }
    
    func get_random_pos() -> [Int] {
        var i = 0
        var j = 0
        
        var inums: Set = [0,1,2,3,4,5,6,7,8]
        while (!inums.isEmpty) {
            i = inums.randomElement()!
            var jnums: Set = [0,1,2,3,4,5,6,7,8]
            while (!jnums.isEmpty) {
                j = jnums.randomElement()!
                if (self.rows[j][i] != 0) {
                    return [i,j]
                } else {
                    jnums.remove(j)
                }
            }
            inums.remove(i)
        }
        return [i, j]
    }
    
    func get_next_pos() -> [Int] {
        for i in 0...8 {
            for j in 0...8 {
                if (self.rows[j][i] == 0) {
                    return [i, j]
                }
            }
        }
        // signifies full grid
        return [-1,-1]
    }
    
    func copy() -> Sudoku {
        let new_game = Sudoku(array: self.rows)
        return new_game
    }
    
    func start() {
        self.start_grid = self.rows
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
    
    func assign_domains(stop: Bool) -> (Int, [Int]) {
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
                        self.add_number(pos: [i, j], num: Array(new_allowed)[0])
                        if stop {
                            return (Array(new_allowed)[0], [i, j])
                        }
                    }
                    else {
                        self.allowed[i*10+j] = new_allowed
                    }
                }
            }
        }
        return (0, [Int]())
    }
    func check_squares(stop: Bool) -> (Int, [Int]) {
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
                        if stop {
                            return (num, spot)
                        }
                    }
                }
            }
        }
        return (0, [Int]())
    }
    func check_rows(stop: Bool) -> (Int, [Int]) {
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
                        if stop {
                            return (num, spot)
                        }
                    }
                }
            }
        }
        return (0, [Int]())
    }
    func check_cols(stop: Bool) -> (Int, [Int]) {
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
                        if stop {
                            return (num, spot)
                        }
                    }
                }
            }
        }
        return (0, [Int]())
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
    func next() -> ([[Int]], String, Int, [Int]) {
        var (num, spot) = self.assign_domains(stop: true)
        if num != 0 {
            return (self.rows, "Had to place a " + String(num) + " because any other number in this spot would break a rule", 1, spot)
        }
        (num, spot) = self.check_squares(stop: true)
        if num != 0 {
            return (self.rows, "Had to place a " + String(num) + " it could not go in any other spot in this square.", 2, spot)
        }
        (num, spot) = self.check_rows(stop: true)
        if num != 0 {
            return (self.rows, "Had to place a " + String(num) + " it could not go in any other spot in this row.", 3, spot)
        }
        (num, spot) = self.check_cols(stop: true)
        if num != 0 {
            return (self.rows, "Had to place a " + String(num) + " it could not go in any other spot in this column.", 4, spot)
        }
        self.check_blocked_cols()
        self.check_blocked_rows()
        return ([[Int]](), "oof", 0, [Int]())
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
            self.assign_domains(stop: false)
            self.check_squares(stop: false)
            self.check_rows(stop: false)
            self.check_cols(stop: false)
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
        // try to make a guess between two places in a square for one number
        let new_game = self.copy()
        var found = false
        var p2 = [Int]()
        var number = 0
        for square in 0...8 {
            for num in 1...9 {
                if !self.squares[square].contains(num) {
                    var possibilities = [[Int]]()
                    for b in 0...8 {
                        let pos = self.pos_from_square(square: square, index: b)
                        let i = pos[0]
                        let j = pos[1]
                        if self.allowed[i*10+j] != nil && self.allowed[i*10+j]!.contains(num) {
                            possibilities.append(pos)
                        }
                    }
                    if possibilities.count == 2 {
                        let p1 = possibilities[0]
                        p2 = possibilities[1]
                        number = num
                        new_game.add_number(pos: p1, num: number)
                        found = true
                        break
                    }
                }
            }
            if found {
                break
            }
        }
        if found {
            var (finished, ans) = new_game.solve()
            if !finished {
                let new_game = self.copy()
                new_game.add_number(pos: p2, num: number)
                (finished, ans) = new_game.solve()
            }
            return (finished, ans)
        }
        else {
            let new_game = self.copy()
            var found = false
            var p2 = [Int]()
            var p3 = [Int]()
            var number = 0
            for square in 0...8 {
                for num in 1...9 {
                    if !self.squares[square].contains(num) {
                        var possibilities = [[Int]]()
                        for b in 0...8 {
                            let pos = self.pos_from_square(square: square, index: b)
                            let i = pos[0]
                            let j = pos[1]
                            if self.allowed[i*10+j] != nil && self.allowed[i*10+j]!.contains(num) {
                                possibilities.append(pos)
                            }
                        }
                        if possibilities.count == 3 {
                            let p1 = possibilities[0]
                            p2 = possibilities[1]
                            p3 = possibilities[2]
                            number = num
                            new_game.add_number(pos: p1, num: number)
                            found = true
                            break
                        }
                    }
                }
                if found {
                    break
                }
            }
            if found {
                var (finished, ans) = new_game.solve()
                if !finished {
                    let new_game = self.copy()
                    new_game.add_number(pos: p2, num: number)
                    (finished, ans) = new_game.solve()
                }
                if !finished {
                    let new_game = self.copy()
                    new_game.add_number(pos: p3, num: number)
                    (finished, ans) = new_game.solve()
                }
                return (finished, ans)
            }
            else {
                print("rip")
                print(self.rows)
                return (false, [[Int]]())
            }
        }
    }
}
