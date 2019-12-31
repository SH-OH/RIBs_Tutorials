//
//  Scoretream.swift
//  TicTacToe
//
//  Created by Oh Sangho on 2019/12/06.
//  Copyright © 2019 Uber. All rights reserved.
//

import RxSwift
import RxCocoa

struct Score {
    let player1Score: Int
    let player2Score: Int

    static func equals(lhs: Score, rhs: Score) -> Bool {
        return lhs.player1Score == rhs.player1Score && lhs.player2Score == rhs.player2Score
    }
}

protocol ScoreStream: class {
    var score: Observable<Score> { get }
}

protocol MutableScoreStream: ScoreStream {
    func updateScore(withWinner winner: PlayerType)
}

class ScoreStreamImpl: MutableScoreStream {

    var score: Observable<Score> {
        return variable
            .asObservable()
            .distinctUntilChanged { (lhs: Score, rhs: Score) -> Bool in
                Score.equals(lhs: lhs, rhs: rhs)
            }
    }

    func updateScore(withWinner winner: PlayerType) {
        let newScore: Score? = {
            let currentScore = variable.value
            switch winner {
            case .player1:
                return Score(player1Score: currentScore.player1Score + 1, player2Score: currentScore.player2Score)
            case .player2:
                return Score(player1Score: currentScore.player1Score, player2Score: currentScore.player2Score + 1)
            case .draw:
                return nil
            }
        }()
        if let newScore = newScore {
            variable.accept(newScore)
        }
    }

    // MARK: - Private

    private let variable = BehaviorRelay<Score>(value: Score(player1Score: 0, player2Score: 0))
}
