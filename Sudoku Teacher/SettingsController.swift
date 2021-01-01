//
//  SettingsController.swift
//  Sudoku Teacher
//
//  Created by Viktoriya Tabunshchyk on 2021-01-01.
//  Copyright © 2021 Viktoriya Tabunshchyk. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var backButton: UIButton!
    var colors: [String] = [String]()
    var colorPicked = "Purple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.addTarget(self, action: #selector(clickBack(_:)), for: .touchUpInside)
        self.colorPicker.delegate = self
        self.colorPicker.dataSource = self
        
        colors = ["Purple", "Yellow", "Black", "Blue", "Green"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorPicked = colors[row]
        }
    
    @IBAction func clickBack(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nextView = sb.instantiateViewController(identifier: "HomeController") as! HomeController
        nextView.colour = colorPicked
        self.present(nextView, animated: true, completion: nil)
    }
    
}
