//
//  LoggedInInteractor.swift
//  TicTacToe
//
//  Created by Oh Sangho on 2019/11/10.
//  Copyright © 2019 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToOffGame()
    func routeToTicTacToe()
}

protocol LoggedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {
    
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    
    // MARK: - OffGameListener
    
    func didStartTicTacToe() {
        router?.routeToTicTacToe()
    }
    
    // MARK: - TicTacToeListener
    
    func gameDidEnd() {
        router?.routeToOffGame()
    }
    
}
