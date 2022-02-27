import UIKit

// MARK: - Enum

enum CaloriesCalculationType {
    case mifflin
    case harrisBenedict
}

enum ProportionType {
    case paleo
    case keto
}

// MARK: - Struct

struct Nutrients {
    let carbs: Int
    let fats: Int
    let proteins: Int
}

// MARK: - Protocol

protocol CaloriesCalculation {
    func calculateProportion(proportionType: ProportionType) -> Nutrients
}

protocol ProportionCalculation {
    func calculateTargetCalories(caloriesCalculatorType: CaloriesCalculationType) -> Int
}

// MARK: - Class
class Calories: CaloriesCalculation {
    func calculateProportion(proportionType: ProportionType) -> Nutrients {
        var nutrients: Nutrients
        
        switch proportionType {
        case .paleo:
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        return nutrients
    }
    
}

class Proportion: ProportionCalculation {
    func calculateTargetCalories(caloriesCalculatorType: CaloriesCalculationType) -> Int {
        var targetCalories: Int
        
        switch caloriesCalculatorType {
        case .harrisBenedict:
            targetCalories = 1200
        case .mifflin:
            targetCalories = 1400
        }
        return targetCalories
    }
    
}

var someCalories = Calories()
someCalories.calculateProportion(proportionType: .keto)

var someProportion = Proportion()
someProportion.calculateTargetCalories(caloriesCalculatorType: .mifflin)

// MARK: - Class SRP
class SRPViewController {
    
    var calories = Calories()
    var proportion = Proportion()

}






