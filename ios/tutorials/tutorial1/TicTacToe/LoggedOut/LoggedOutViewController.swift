//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by Oh Sangho on 2019/11/10.
//  Copyright © 2019 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: class {
    func login(withPlayer1Name player1Name: String?, player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    
    private let player1Field: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.line
        tf.placeholder = "Player 1 name"
        return tf
    }()
    private let player2Field: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.line
        tf.placeholder = "Player 2 name"
        return tf
    }()
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(player1Field)
        view.addSubview(player2Field)
        view.addSubview(loginButton)
        layout()
    }

    // MARK: - Private
    
    private func layout() {
        player1Field.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(self.view).offset(100)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(40)
        }
        player2Field.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(player1Field.snp.bottom).offset(20)
            maker.leading.trailing.height.equalTo(player1Field)
        }
        loginButton.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(player2Field.snp.bottom).offset(20)
            maker.leading.trailing.height.equalTo(player1Field)
        }
    }
    
    @objc private func didTapLoginButton() {
        listener?.login(withPlayer1Name: player1Field.text, player2Name: player2Field.text)
    }
}
// MARK: - LoggedOutPresentableListener

func login(withPlayer1Name player1Name: String?, player2Name: String?) {
    let player1NameWithDefault = playerName(player1Name, withDefaultName: "Player 1")
    let player2NameWithDefault = playerName(player2Name, withDefaultName: "Player 2")

    print("\(player1NameWithDefault) vs \(player2NameWithDefault)")
}

private func playerName(_ name: String?, withDefaultName defaultName: String) -> String {
    if let name = name {
        return name.isEmpty ? defaultName : name
    } else {
        return defaultName
    }
}
