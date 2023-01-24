//
//  ResultsViewController.swift
//  BMI Calculator
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        configButtons()
    }
    
    private func configButtons() {
        recalculateButton.layer.cornerRadius = recalculateButton.frame.size.height/2
        recalculateButton.clipsToBounds = true
    }
    
    private func configureScreen(){
        resultLabel.text = String(format: "%.2f", bmi?.value ?? 0)
        adviceLabel.text = bmi?.advice
        view.backgroundColor = bmi?.color
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
