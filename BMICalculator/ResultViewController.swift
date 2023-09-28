//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by 이대현 on 2023/09/28.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbBMI: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    
    var physicalData: PhysicalData = PhysicalData(height: 0, weight: 0)
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView(data: physicalData)
        // Do any additional setup after loading the view.
    }
    @IBAction func onTouchReCalculate(_ sender: Any) {
        super.dismiss(animated: true)
    }
    
    func setupView(data: PhysicalData) {
        let bmi = bmi(height: data.height, weight: data.weight)
        
        if bmi < 20 {
            lbResult.text = "저체중"
            lbResult.backgroundColor = UIColor.blue
        } else if bmi >= 20 && bmi < 24 {
            lbResult.text = "정상"
            lbResult.backgroundColor = UIColor.green
        } else if bmi >= 24 && bmi < 29 {
            lbResult.text = "과체중"
            lbResult.backgroundColor = UIColor.orange
        } else {
            lbResult.text = "비만"
            lbResult.backgroundColor = UIColor.red
        }
        lbBMI.text = String(bmi)
    }
    
    func bmi(height: Int, weight: Int) -> Double {
        let heightM: Double = Double(height) / 100.0
        return round(Double(weight) / Double(heightM * heightM) * 10) / 10
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
