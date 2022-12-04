import Foundation

class RockPaperScissors {
    
    func play() -> Int {
        
        return -1
    }
    
}

enum RPSPlayableItem {
    case rock
    case paper
    case scissors
    
    func canBeat(item: RPSPlayableItem) -> Bool {
        switch self {
        case .paper:
            return item == .rock
        case .rock:
            return item == .scissors
        case .scissors:
            return item == .paper
        }
    }
    
    static func createItem(from character: String) -> RPSPlayableItem? {
        if character == "X" || character == "A" {
            return .rock
        } else if character == "Y" || character == "B" {
            return .paper
        } else if character == "Z" || character == "C" {
            return .scissors
        }
        return nil
    }
}
