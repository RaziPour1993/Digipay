import Foundation

final class MainCoordinatorFactory: CoordinatorFactory {
    
    var childCoordinators: [Coordinator]
    var screenFactory: ScreenFactory
    
    init() {
        self.childCoordinators = []
        self.screenFactory = MainScreenFactory()
    }
    
    func makeLoginCoordinator(_ router: Router, delegate: LoginCoordinatorDelegate) -> LoginCoordinator {
        let coordinator = LoginCoordinator(self, self.screenFactory, router)
        self.addChildCoordinator(coordinator)
        return coordinator
    }
    
}
