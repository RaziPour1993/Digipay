import Foundation

protocol ScreenFactory {
 
    func makeLoginScreen(delegate: LoginScreenDelegate) -> LoginViewController
    func makeSearchScreen(delegate: SearchScreenDelegate) -> SearchViewController
    
}
