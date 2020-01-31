//
//  ViewController.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 1/29/20.
//  Copyright © 2020 Viktoriya Tabunshchyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let light_purple: UIColor = UIColor(red: 233/255, green: 208/255, blue: 245/255, alpha: 1)
    let purple: UIColor = UIColor(red: 142/255, green: 18/255, blue: 199/255, alpha: 1)
    let dark_purple: UIColor = UIColor(red: 33/255, green: 4/255, blue: 46/255, alpha: 1)
    var clicked_num: Int = 0
    var adding_nums: Bool = true
    var grid_buttons: [UIButton] = []
    var purple_buttons: [UIButton] = []
    var num_buttons: [UIButton] = []
    var main_buttons: [UIButton] = []
    var game = Sudoku()
    var coord_to_bttn = [Int: UIButton]()
    @IBOutlet weak var B00: UIButton!
    @IBOutlet weak var B01: UIButton!
    @IBOutlet weak var B02: UIButton!
    @IBOutlet weak var B03: UIButton!
    @IBOutlet weak var B04: UIButton!
    @IBOutlet weak var B05: UIButton!
    @IBOutlet weak var B06: UIButton!
    @IBOutlet weak var B07: UIButton!
    @IBOutlet weak var B08: UIButton!
    @IBOutlet weak var B10: UIButton!
    @IBOutlet weak var B11: UIButton!
    @IBOutlet weak var B12: UIButton!
    @IBOutlet weak var B13: UIButton!
    @IBOutlet weak var B14: UIButton!
    @IBOutlet weak var B15: UIButton!
    @IBOutlet weak var B16: UIButton!
    @IBOutlet weak var B17: UIButton!
    @IBOutlet weak var B18: UIButton!
    @IBOutlet weak var B20: UIButton!
    @IBOutlet weak var B21: UIButton!
    @IBOutlet weak var B22: UIButton!
    @IBOutlet weak var B23: UIButton!
    @IBOutlet weak var B24: UIButton!
    @IBOutlet weak var B25: UIButton!
    @IBOutlet weak var B26: UIButton!
    @IBOutlet weak var B27: UIButton!
    @IBOutlet weak var B28: UIButton!
    @IBOutlet weak var B30: UIButton!
    @IBOutlet weak var B31: UIButton!
    @IBOutlet weak var B32: UIButton!
    @IBOutlet weak var B33: UIButton!
    @IBOutlet weak var B34: UIButton!
    @IBOutlet weak var B35: UIButton!
    @IBOutlet weak var B36: UIButton!
    @IBOutlet weak var B37: UIButton!
    @IBOutlet weak var B38: UIButton!
    @IBOutlet weak var B40: UIButton!
    @IBOutlet weak var B41: UIButton!
    @IBOutlet weak var B42: UIButton!
    @IBOutlet weak var B43: UIButton!
    @IBOutlet weak var B44: UIButton!
    @IBOutlet weak var B45: UIButton!
    @IBOutlet weak var B46: UIButton!
    @IBOutlet weak var B47: UIButton!
    @IBOutlet weak var B48: UIButton!
    @IBOutlet weak var B50: UIButton!
    @IBOutlet weak var B51: UIButton!
    @IBOutlet weak var B52: UIButton!
    @IBOutlet weak var B53: UIButton!
    @IBOutlet weak var B54: UIButton!
    @IBOutlet weak var B55: UIButton!
    @IBOutlet weak var B56: UIButton!
    @IBOutlet weak var B57: UIButton!
    @IBOutlet weak var B58: UIButton!
    @IBOutlet weak var B60: UIButton!
    @IBOutlet weak var B61: UIButton!
    @IBOutlet weak var B62: UIButton!
    @IBOutlet weak var B63: UIButton!
    @IBOutlet weak var B64: UIButton!
    @IBOutlet weak var B65: UIButton!
    @IBOutlet weak var B66: UIButton!
    @IBOutlet weak var B67: UIButton!
    @IBOutlet weak var B68: UIButton!
    @IBOutlet weak var B70: UIButton!
    @IBOutlet weak var B71: UIButton!
    @IBOutlet weak var B72: UIButton!
    @IBOutlet weak var B73: UIButton!
    @IBOutlet weak var B74: UIButton!
    @IBOutlet weak var B75: UIButton!
    @IBOutlet weak var B76: UIButton!
    @IBOutlet weak var B77: UIButton!
    @IBOutlet weak var B78: UIButton!
    @IBOutlet weak var B80: UIButton!
    @IBOutlet weak var B81: UIButton!
    @IBOutlet weak var B82: UIButton!
    @IBOutlet weak var B83: UIButton!
    @IBOutlet weak var B84: UIButton!
    @IBOutlet weak var B85: UIButton!
    @IBOutlet weak var B86: UIButton!
    @IBOutlet weak var B87: UIButton!
    @IBOutlet weak var B88: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    @IBOutlet weak var BClear: UIButton!
    @IBOutlet weak var BExplain: UIButton!
    @IBOutlet weak var BNext: UIButton!
    @IBOutlet weak var BSolve: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init buttons
        grid_buttons = [B00, B01, B02, B03, B04, B05, B06, B07, B08, B10, B11, B12, B13, B14, B15, B16, B17, B18, B20, B21, B22, B23, B24, B25, B26, B27, B28, B30, B31, B32, B33, B34, B35, B36, B37, B38, B40, B41, B42, B43, B44, B45, B46, B47, B48, B50, B51, B52, B53, B54, B55, B56, B57, B58, B60, B61, B62, B63, B64, B65, B66, B67, B68, B70, B71, B72, B73, B74, B75, B76, B77, B78, B80, B81, B82, B83, B84, B85, B86, B87, B88]
        
        purple_buttons = [B00, B01, B02, B06, B07, B08, B10, B11, B12, B16, B17, B18, B20, B21, B22, B26, B27, B28, B33, B34, B35, B43, B44, B45, B53, B54, B55, B60, B61, B62, B66, B67, B68, B70, B71, B72, B76, B77, B78, B80, B81, B82, B86, B87, B88]
        
        num_buttons = [B1, B2, B3, B4, B5, B6, B7, B8, B9]
        
        main_buttons = [BClear, BExplain, BNext, BSolve]
        
        coord_to_bttn = [0: B00, 1: B01, 2: B02, 3: B03, 4: B04, 5: B05, 6: B06, 7: B07, 8: B08, 10: B10, 11: B11, 12: B12, 13: B13, 14: B14, 15: B15, 16: B16, 17: B17, 18: B18, 20: B20, 21: B21, 22: B22, 23: B23, 24: B24, 25: B25, 26: B26, 27: B27, 28: B28, 30: B30, 31: B31, 32: B32, 33: B33, 34: B34, 35: B35, 36: B36, 37: B37, 38: B38, 40: B40, 41: B41, 42: B42, 43: B43, 44: B44, 45: B45, 46: B46, 47: B47, 48: B48, 50: B50, 51: B51, 52: B52, 53: B53, 54: B54, 55: B55, 56: B56, 57: B57, 58: B58, 60: B60, 61: B61, 62: B62, 63: B63, 64: B64, 65: B65, 66: B66, 67: B67, 68: B68, 70: B70, 71: B71, 72: B72, 73: B73, 74: B74, 75: B75, 76: B76, 77: B77, 78: B78, 80: B80, 81: B81, 82: B82, 83: B83, 84: B84, 85: B85, 86: B86, 87: B87, 88: B88]
        
        for button in grid_buttons {
            button.layer.borderColor = dark_purple.cgColor
            button.layer.borderWidth = 1.0
            button.setTitleColor(purple, for: [])
        }
        
        for button in purple_buttons {
            button.backgroundColor = light_purple
        }
        
        for button in num_buttons {
            button.layer.borderColor = dark_purple.cgColor
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 5.0
        }
        
        for button in main_buttons {
            button.layer.borderColor = dark_purple.cgColor
            button.backgroundColor = light_purple
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 5.0
        }
    }
    
    func change_clicked(button: UIButton) {
        if adding_nums {
            button.backgroundColor = light_purple
            for b in num_buttons {
                if b != button {
                    b.backgroundColor = .white
                }
            }
        }
    }
    
    func add_number(button: UIButton, spot: [Int]) {
        if clicked_num != 0 && adding_nums {
            if !game.breaks_rule(pos: spot, num: clicked_num) {
                button.setTitle(String(clicked_num), for: .normal)
                button.setTitleColor(.black, for: [])
                game.add_number(pos: spot, num: clicked_num)
            }
        }
    }
    @IBAction func next_click(_ sender: Any) {
        let (answer, explanation) = game.next()
        if explanation != "oof" {
            print(explanation)
            for i in 0...8 {
                for j in 0...8 {
                    let num = answer[j][i]
                    if num != 0 {
                        let button = coord_to_bttn[i*10+j]
                        button?.setTitle(String(num), for: .normal)
                    }
                }
            }
        }
    }
    
    @IBAction func solve_click(_ sender: Any) {
        let (finished, answer, _) = game.solve()
        if finished {
            print(answer)
            for i in 0...8 {
                for j in 0...8 {
                    let num = answer[j][i]
                    let button = coord_to_bttn[i*10+j]
                    button?.setTitle(String(num), for: .normal)
                }
            }
        }
    }
    @IBAction func b00_click(_ sender: Any) {
        add_number(button: B00, spot: [0, 0])
    }
    @IBAction func b01_click(_ sender: Any) {
        add_number(button: B01, spot: [0, 1])
    }
    @IBAction func b02_click(_ sender: Any) {
        add_number(button: B02, spot: [0, 2])
    }
    @IBAction func b03_click(_ sender: Any) {
        add_number(button: B03, spot: [0, 3])
    }
    @IBAction func b04_click(_ sender: Any) {
        add_number(button: B04, spot: [0, 4])
    }
    @IBAction func b05_click(_ sender: Any) {
        add_number(button: B05, spot: [0, 5])
    }
    @IBAction func b06_click(_ sender: Any) {
        add_number(button: B06, spot: [0, 6])
    }
    @IBAction func b07_click(_ sender: Any) {
        add_number(button: B07, spot: [0, 7])
    }
    @IBAction func b08_click(_ sender: Any) {
        add_number(button: B08, spot: [0, 8])
    }
    @IBAction func b10_click(_ sender: Any) {
        add_number(button: B10, spot: [1, 0])
    }
    @IBAction func b11_click(_ sender: Any) {
        add_number(button: B11, spot: [1, 1])
    }
    @IBAction func b12_click(_ sender: Any) {
        add_number(button: B12, spot: [1, 2])
    }
    @IBAction func b13_click(_ sender: Any) {
        add_number(button: B13, spot: [1, 3])
    }
    @IBAction func b14_click(_ sender: Any) {
        add_number(button: B14, spot: [1, 4])
    }
    @IBAction func b15_click(_ sender: Any) {
        add_number(button: B15, spot: [1, 5])
    }
    @IBAction func b16_click(_ sender: Any) {
        add_number(button: B16, spot: [1, 6])
    }
    @IBAction func b17_click(_ sender: Any) {
        add_number(button: B17, spot: [1, 7])
    }
    @IBAction func b18_click(_ sender: Any) {
        add_number(button: B18, spot: [1, 8])
    }
    @IBAction func b20_click(_ sender: Any) {
        add_number(button: B20, spot: [2, 0])
    }
    @IBAction func b21_click(_ sender: Any) {
        add_number(button: B21, spot: [2, 1])
    }
    @IBAction func b22_click(_ sender: Any) {
        add_number(button: B22, spot: [2, 2])
    }
    @IBAction func b23_click(_ sender: Any) {
        add_number(button: B23, spot: [2, 3])
    }
    @IBAction func b24_click(_ sender: Any) {
        add_number(button: B24, spot: [2, 4])
    }
    @IBAction func b25_click(_ sender: Any) {
        add_number(button: B25, spot: [2, 5])
    }
    @IBAction func b26_click(_ sender: Any) {
        add_number(button: B26, spot: [2, 6])
    }
    @IBAction func b27_click(_ sender: Any) {
        add_number(button: B27, spot: [2, 7])
    }
    @IBAction func b28_click(_ sender: Any) {
        add_number(button: B28, spot: [2, 8])
    }
    @IBAction func b30_click(_ sender: Any) {
        add_number(button: B30, spot: [3, 0])
    }
    @IBAction func b31_click(_ sender: Any) {
        add_number(button: B31, spot: [3, 1])
    }
    @IBAction func b32_click(_ sender: Any) {
        add_number(button: B32, spot: [3, 2])
    }
    @IBAction func b33_click(_ sender: Any) {
        add_number(button: B33, spot: [3, 3])
    }
    @IBAction func b34_click(_ sender: Any) {
        add_number(button: B34, spot: [3, 4])
    }
    @IBAction func b35_click(_ sender: Any) {
        add_number(button: B35, spot: [3, 5])
    }
    @IBAction func b36_click(_ sender: Any) {
        add_number(button: B36, spot: [3, 6])
    }
    @IBAction func b37_click(_ sender: Any) {
        add_number(button: B37, spot: [3, 7])
    }
    @IBAction func b38_click(_ sender: Any) {
        add_number(button: B38, spot: [3, 8])
    }
    @IBAction func b40_click(_ sender: Any) {
        add_number(button: B40, spot: [4, 0])
    }
    @IBAction func b41_click(_ sender: Any) {
        add_number(button: B41, spot: [4, 1])
    }
    @IBAction func b42_click(_ sender: Any) {
        add_number(button: B42, spot: [4, 2])
    }
    @IBAction func b43_click(_ sender: Any) {
        add_number(button: B43, spot: [4, 3])
    }
    @IBAction func b44_click(_ sender: Any) {
        add_number(button: B44, spot: [4, 4])
    }
    @IBAction func b45_click(_ sender: Any) {
        add_number(button: B45, spot: [4, 5])
    }
    @IBAction func b46_click(_ sender: Any) {
        add_number(button: B46, spot: [4, 6])
    }
    @IBAction func b47_click(_ sender: Any) {
        add_number(button: B47, spot: [4, 7])
    }
    @IBAction func b48_click(_ sender: Any) {
        add_number(button: B48, spot: [4, 8])
    }
    @IBAction func b50_click(_ sender: Any) {
        add_number(button: B50, spot: [5, 0])
    }
    @IBAction func b51_click(_ sender: Any) {
        add_number(button: B51, spot: [5, 1])
    }
    @IBAction func b52_click(_ sender: Any) {
        add_number(button: B52, spot: [5, 2])
    }
    @IBAction func b53_click(_ sender: Any) {
        add_number(button: B53, spot: [5, 3])
    }
    @IBAction func b54_click(_ sender: Any) {
        add_number(button: B54, spot: [5, 4])
    }
    @IBAction func b55_click(_ sender: Any) {
        add_number(button: B55, spot: [5, 5])
    }
    @IBAction func b56_click(_ sender: Any) {
        add_number(button: B56, spot: [5, 6])
    }
    @IBAction func b57_click(_ sender: Any) {
        add_number(button: B57, spot: [5, 7])
    }
    @IBAction func b58_click(_ sender: Any) {
        add_number(button: B58, spot: [5, 8])
    }
    @IBAction func b60_click(_ sender: Any) {
        add_number(button: B60, spot: [6, 0])
    }
    @IBAction func b61_click(_ sender: Any) {
        add_number(button: B61, spot: [6, 1])
    }
    @IBAction func b62_click(_ sender: Any) {
        add_number(button: B62, spot: [6, 2])
    }
    @IBAction func b63_click(_ sender: Any) {
        add_number(button: B63, spot: [6, 3])
    }
    @IBAction func b64_click(_ sender: Any) {
        add_number(button: B64, spot: [6, 4])
    }
    @IBAction func b65_click(_ sender: Any) {
        add_number(button: B65, spot: [6, 5])
    }
    @IBAction func b66_click(_ sender: Any) {
        add_number(button: B66, spot: [6, 6])
    }
    @IBAction func b67_click(_ sender: Any) {
        add_number(button: B67, spot: [6, 7])
    }
    @IBAction func b68_click(_ sender: Any) {
        add_number(button: B68, spot: [6, 8])
    }
    @IBAction func b70_click(_ sender: Any) {
        add_number(button: B70, spot: [7, 0])
    }
    @IBAction func b71_click(_ sender: Any) {
        add_number(button: B71, spot: [7, 1])
    }
    @IBAction func b72_click(_ sender: Any) {
        add_number(button: B72, spot: [7, 2])
    }
    @IBAction func b73_click(_ sender: Any) {
        add_number(button: B73, spot: [7, 3])
    }
    @IBAction func b74_click(_ sender: Any) {
        add_number(button: B74, spot: [7, 4])
    }
    @IBAction func b75_click(_ sender: Any) {
        add_number(button: B75, spot: [7, 5])
    }
    @IBAction func b76_click(_ sender: Any) {
        add_number(button: B76, spot: [7, 6])
    }
    @IBAction func b77_click(_ sender: Any) {
        add_number(button: B77, spot: [7, 7])
    }
    @IBAction func b78_click(_ sender: Any) {
        add_number(button: B78, spot: [7, 8])
    }
    @IBAction func b80_click(_ sender: Any) {
        add_number(button: B80, spot: [8, 0])
    }
    @IBAction func b81_click(_ sender: Any) {
        add_number(button: B81, spot: [8, 1])
    }
    @IBAction func b82_click(_ sender: Any) {
        add_number(button: B82, spot: [8, 2])
    }
    @IBAction func b83_click(_ sender: Any) {
        add_number(button: B83, spot: [8, 3])
    }
    @IBAction func b84_click(_ sender: Any) {
        add_number(button: B84, spot: [8, 4])
    }
    @IBAction func b85_click(_ sender: Any) {
        add_number(button: B85, spot: [8, 5])
    }
    @IBAction func b86_click(_ sender: Any) {
        add_number(button: B86, spot: [8, 6])
    }
    @IBAction func b87_click(_ sender: Any) {
        add_number(button: B87, spot: [8, 7])
    }
    @IBAction func b88_click(_ sender: Any) {
        add_number(button: B88, spot: [8, 8])
    }
    
    @IBAction func b1_click(_ sender: Any) {
        clicked_num = 1
        change_clicked(button: B1)
    }
    @IBAction func b2_click(_ sender: Any) {
        clicked_num = 2
        change_clicked(button: B2)
    }
    @IBAction func b3_click(_ sender: Any) {
        clicked_num = 3
        change_clicked(button: B3)
    }
    @IBAction func b4_click(_ sender: Any) {
        clicked_num = 4
        change_clicked(button: B4)
    }
    @IBAction func b5_click(_ sender: Any) {
        clicked_num = 5
        change_clicked(button: B5)
    }
    @IBAction func b6_click(_ sender: Any) {
        clicked_num = 6
        change_clicked(button: B6)
    }
    @IBAction func b7_click(_ sender: Any) {
        clicked_num = 7
        change_clicked(button: B7)
    }
    @IBAction func b8_click(_ sender: Any) {
        clicked_num = 8
        change_clicked(button: B8)
    }
    @IBAction func b9_click(_ sender: Any) {
        clicked_num = 9
        change_clicked(button: B9)
    }
}
