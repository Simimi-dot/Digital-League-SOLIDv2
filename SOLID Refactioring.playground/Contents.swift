import UIKit
import Foundation


// MARK: - Enum
enum CaloriesCalculationType: Int {
    case mifflin = 1200
    case harrisBenedict = 1400
}

enum ProportionType {
    case paleo
    case keto
}

extension ProportionType {
    func nutrients() -> Nutrients {
        switch self {
        case .paleo:
            return Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            return Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
    }
}

struct Nutrients {
    var carbs: Int = 0
    var fats: Int = 0
    var proteins: Int = 0
}

protocol CaloriesType {
    var caloriesType: CaloriesCalculationType { get }
}

protocol NutrientCalculateMethod {
    func calculateDailyNutrients(proportionType: ProportionType) -> Nutrients
}

//MARK: - Struct

struct NutrientCalculator: CaloriesType {
    var caloriesType: CaloriesCalculationType
}

extension NutrientCalculator: NutrientCalculateMethod {
    func calculateDailyNutrients(proportionType: ProportionType) -> Nutrients {
        return proportionType.nutrients()
    }
}

var calculate = NutrientCalculator(caloriesType: .mifflin)
calculate.calculateDailyNutrients(proportionType: .keto)
