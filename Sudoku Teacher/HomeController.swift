//
//  HomeController.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 2020-12-31.
//  Copyright © 2020 Viktoriya Tabunshchyk. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    var colour = "Purple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        easyButton.addTarget(self, action: #selector(clickEasy(_:)), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(clickMedium(_:)), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(clickHard(_:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(clickSettings(_:)), for: .touchUpInside)
    }
    
    @IBAction func clickEasy(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nextView = sb.instantiateViewController(identifier: "ViewController") as! ViewController
        nextView.difficulty = "easy"
        nextView.colour = colour
        self.present(nextView, animated: true, completion: nil)
    }
    @IBAction func clickMedium(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nextView = sb.instantiateViewController(identifier: "ViewController") as! ViewController
        nextView.difficulty = "medium"
        nextView.colour = colour
        self.present(nextView, animated: true, completion: nil)
    }
    @IBAction func clickHard(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nextView = sb.instantiateViewController(identifier: "ViewController") as! ViewController
        nextView.difficulty = "hard"
        nextView.colour = colour
        self.present(nextView, animated: true, completion: nil)
    }
    @IBAction func clickSettings(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nextView = sb.instantiateViewController(identifier: "SettingsController") as! SettingsController
        self.present(nextView, animated: true, completion: nil)
    }
    
}
