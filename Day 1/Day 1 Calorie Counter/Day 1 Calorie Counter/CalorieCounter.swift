import Foundation

protocol CalorieCounting {
    func getMostCalories(from input: String) -> Int
    
}

class CalorieCounter {
    
    func getMostCalories(from input: String) -> Int {
        let valuesByElf = getValuesPerElf(input: input)
        let addCaloriesTogether = addCaloriesTogether(values: valuesByElf)
        return addCaloriesTogether.max() ?? 0
    }

    private func getValuesPerElf(input: String) -> [String] {
        return  input.components(separatedBy: "\n\n")
    }
    
    private func addCaloriesTogether(values: [String]) -> [Int] {
        var elfValues = [Int]()
        for elf in values {
            let elfCalories = elf.components(separatedBy: "\n")
            let elfCalorieValues = elfCalories.map { Int($0) }
            let sum = elfCalorieValues.reduce(0,{ x, y in
                x + (y ?? 0)
            })
            elfValues.append(sum)
        }
        return elfValues
    }
}
