import UIKit

final class MainScreenFactory: ScreenFactory {
    
    var repository: RepositoryIMP
    
    init() {
        self.repository = RepositoryIMP()
    }
    
    func makeSearchScreen(delegate: SearchScreenDelegate) -> SearchViewController {
        let presenter = SearchPresenterIMP(delegate: delegate, self.repository)
        let vc = SearchViewController(presenter)
        return vc
    }
    
    func makeLoginScreen(delegate: LoginScreenDelegate) -> LoginViewController {
        let presenter = LoginPresenterIMP(delegate: delegate)
        let vc = LoginViewController(presenter)
        return vc
    }
    
}
