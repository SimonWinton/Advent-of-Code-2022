import Foundation

class RockPaperScissors {
    
    func play(from data: String) -> Int {
        let games = getGames(from: data)
        var score = 0
        for game in games {
            score += playGame(with: game)
        }
        
        return score
    }
    
    private func getGames(from data: String) -> [String] {
        return data.components(separatedBy: "\n")
    }
    
    private func playGame(with game: String) -> Int {
        let choices = game.components(separatedBy: " ")
        let playerOne = RPSPlayableItem.createItem(from: choices.first)
        let playResult = scoreType.create(from: choices.last)
        
        guard let playerOne = playerOne,
              let playResult =  playResult else {
                  return 0
              }
        let playerTwo = playerOne.getOpponentPlay(from: playResult)
        guard playerOne != playerTwo else {
            return (playerOne.itemScore) + scoreType.draw.rawValue
        }
        
        let didWin = playerTwo.canBeat(item: playerOne)
        let score = didWin ? scoreType.win.rawValue : scoreType.lose.rawValue
        let finalScore = playerTwo.itemScore + score
        return finalScore
    }
}

enum scoreType: Int {
    case win = 6
    case draw = 3
    case lose = 0
    
    static func create(from character: String?) -> scoreType? {
        guard let character = character else { return nil }
        
        if character == "X" {
            return .lose
        } else if character == "Y" {
            return .draw
        } else if character == "Z" {
            return .win
        }
        return nil
    }
}
