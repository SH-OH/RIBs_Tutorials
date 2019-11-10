//
//  OffGameRouter.swift
//  TicTacToe
//
//  Created by Oh Sangho on 2019/11/10.
//  Copyright © 2019 Uber. All rights reserved.
//

import RIBs

protocol OffGameInteractable: Interactable {
    var router: OffGameRouting? { get set }
    var listener: OffGameListener? { get set }
}

protocol OffGameViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class OffGameRouter: ViewableRouter<OffGameInteractable, OffGameViewControllable>, OffGameRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: OffGameInteractable, viewController: OffGameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
