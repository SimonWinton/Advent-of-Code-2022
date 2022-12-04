enum RPSPlayableItem {
    case rock
    case paper
    case scissors
    
    var itemScore: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }
    
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
    
    static func createItem(from character: String?) -> RPSPlayableItem? {
        guard let character = character else { return nil }
        
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
