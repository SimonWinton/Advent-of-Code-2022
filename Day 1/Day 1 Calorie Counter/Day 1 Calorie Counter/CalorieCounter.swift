import Foundation

protocol CalorieCounting {
    func getMostCalories(from input: String) -> Int
    func getThreeMostCalories(from input: String) -> Int
}

class CalorieCounter {
    
    func getMostCalories(from input: String) -> Int {
        let valuesByElf = getValuesPerElf(input: input)
        return valuesByElf.max() ?? 0
    }
    
    func getThreeMostCalories(from input: String) -> Int {
        let valuesByElf = getValuesPerElf(input: input)
        let sortedArray = valuesByElf.sorted(by: {$0 > $1})
        let values = sortedArray[0...2].reduce(0, { x, y in
            x + y
        })
        return values
    }

    private func getValuesPerElf(input: String) -> [Int] {
        let valuesByElf = input.components(separatedBy: "\n\n")
        return addCaloriesTogether(values: valuesByElf)
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
