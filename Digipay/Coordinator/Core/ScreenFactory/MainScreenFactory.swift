import UIKit

final class MainScreenFactory: ScreenFactory {
    
    func makeLoginScreen(delegate: LoginScreenDelegate) -> LoginViewController {
        let presenter = LoginPresenterIMP(delegate: delegate)
        return LoginViewController(presenter)
    }
    
    init() {
        
    }
    
}
