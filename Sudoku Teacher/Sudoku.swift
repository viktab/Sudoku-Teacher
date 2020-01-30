//
//  Sudoku.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 1/30/20.
//  Copyright © 2020 Viktoriya Tabunshchyk. All rights reserved.
//

import Foundation

class Sudoku {
    init(array: [[Int]]) {
        var rows: [[Int]]
        var cols: [[Int]]
        var squares: [[Int]]
        var allowed = [Int: Set<Int>]()
        rows = array
        cols = [[],[],[],[],[],[],[],[],[]]
        for i in 0...8 {
            for j in 0...8 {
                cols[j].append(array[i][j])
            }
        }
        squares = [[],[],[],[],[],[],[],[],[]]
        for i in 0...8 {
            for j in 0...8 {
                let n = floor(Double(j)/3.0)
                let m = floor(Double(i)/3.0)
                let index = n*3+m
                squares[Int(index)].append(rows[j][i])
            }
        }
        let nums: Set = [1,2,3,4,5,6,7,8,9]
        for i in 0...8 {
            for j in 0...8 {
                allowed[i*10+j] = nums
            }
        }
    }
}
