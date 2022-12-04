enum RPSPlayableItem: CaseIterable {
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
    
    var beatableItem: RPSPlayableItem {
        switch self {
        case .scissors:
            return .paper
        case .paper:
            return .rock
        case .rock:
            return .scissors
        }
    }
    
    func getOpponentPlay(from result: scoreType) -> RPSPlayableItem {
        switch result {
        case .draw:
            return self
        case .win:
            var itemBeatenBy: RPSPlayableItem?
            for item in RPSPlayableItem.allCases {
                if item.beatableItem == self {
                    itemBeatenBy = item
                }
            }
            guard let playedItem = itemBeatenBy else { fatalError("Item not found") }
            return playedItem
            
        case .lose:
            return self.beatableItem
        }
    }
    
    static func createItem(from character: String?) -> RPSPlayableItem? {
        guard let character = character else { return nil }
        
        if character == "A" {
            return .rock
        } else if character == "B" {
            return .paper
        } else if character == "C" {
            return .scissors
        }
        return nil
    }
}
