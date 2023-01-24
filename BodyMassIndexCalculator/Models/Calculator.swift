//
//  Calculator.swift
//  BMI Calculator
//  Created by Anderson Sales on 30/11/22.
//

import Foundation
import UIKit

struct Calculator {
    
    private var bmi: BMI?
    
    var bmiResult: String {
        return String(format: "%.2f", bmi?.value ?? 0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) -> BMI {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            self.bmi = BMI(value: bmiValue, advice: "You are underweight!", color: .systemBlue)
        } else if bmiValue < 25.0 {
            self.bmi = BMI(value: bmiValue, advice: "You are in good shape!", color: .systemGreen)
        } else {
            self.bmi = BMI(value: bmiValue, advice: "You are overweight!", color: .systemRed)
        }
        
        return bmi ?? BMI(value: 0, advice: "Ohoow", color: .black)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Please try again!!!"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
