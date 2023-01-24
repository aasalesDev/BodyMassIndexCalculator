//
//  ViewController.swift
//  BMI Calculator
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons()
    }
    
    private func configButtons() {
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height/2
        calculateButton.clipsToBounds = true
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.0f", sender.value))kg"
    }
    
    @IBAction func calculateBMIButtonPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController {
            vc.bmi = calculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
