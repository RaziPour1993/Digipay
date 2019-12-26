//
//  LoginViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit
import SpotifyLogin

class LoginViewController: UIViewController {
    
    @IBOutlet weak var spotifyLoginButton: SpotifyLoginButton!
    
    var presenter: LoginPresenter?
    
    init(_ presenter: LoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.set(view: self)
    }
    
    deinit {
        print()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        presenter?.present()
    }
    
    func config(){
        self.spotifyLoginButton.addTarget(self, action: #selector(spotifyLoginButtonAction), for: .touchDown)
    }
    
    @objc func spotifyLoginButtonAction() {
        SpotifyLogin.shared.logout()
        SpotifyLoginPresenter.login(from: self,
                                    scopes: [.streaming,
                                             .userReadTop,
                                             .playlistReadPrivate,
                                             .userLibraryRead]
        )
    }
    
}

extension LoginViewController: LoginPresentingView {
    
    
}
