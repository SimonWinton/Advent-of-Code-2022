import Foundation

class RockPaperScissors {
    
    private enum scoreValues: Int {
        case win = 6
        case draw = 3
        case lose = 0
    }
    
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
        let playerTwo = RPSPlayableItem.createItem(from: choices.last)
        
        guard let playerOne = playerOne,
              let playerTwo = playerTwo else {
                  return 0
              }
        guard playerOne != playerTwo else {
            return (playerOne.itemScore) + scoreValues.draw.rawValue
        }
        
        let didWin = playerTwo.canBeat(item: playerOne)
        let score = didWin ? scoreValues.win.rawValue : scoreValues.lose.rawValue
        let finalScore = playerTwo.itemScore + score
        return finalScore
    }
}
