//
//  ViewController.swift
//  BMICalculator
//
//  Created by 이대현 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTouchCalculate(_ sender: Any) {
        guard let heightText = tfHeight.text,
              let height = Int(heightText) else {
            return
        }
        
        guard let weightText = tfWeight.text,
              let weight = Int(weightText) else {
            return
        }
        
        performSegue(
            withIdentifier: "mainToResult",
            sender: PhysicalData(height: height, weight: weight)
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let resultVC = segue.destination as? ResultViewController,
              let physicalData = sender as? PhysicalData else {
            return
        }
        
        resultVC.physicalData = physicalData
    }
}

