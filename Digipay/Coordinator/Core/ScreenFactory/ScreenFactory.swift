import Foundation

protocol ScreenFactory {
 
    func makeLoginScreen(delegate: LoginScreenDelegate) -> LoginViewController
    
}
