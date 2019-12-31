//
//  ActionableItems.swift
//  TicTacToe
//
//  Created by Oh Sangho on 2019/12/31.
//  Copyright © 2019 Uber. All rights reserved.
//

import RxSwift

public protocol LoggedInActionableItem: class {
    func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
