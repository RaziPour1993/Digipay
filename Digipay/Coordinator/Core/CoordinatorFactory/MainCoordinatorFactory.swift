import Foundation

final class MainCoordinatorFactory: CoordinatorFactory {
    
    var childCoordinators: [Coordinator]
    var screenFactory: ScreenFactory
    var router: Router
    
    init(screenFactory: ScreenFactory, router: Router) {
        self.childCoordinators = []
        self.screenFactory = screenFactory
        self.router = router
    }
    
    func makeLoginCoordinator(delegate: LoginCoordinatorDelegate) -> LoginCoordinator {
        let coordinator = LoginCoordinator(self, self.screenFactory, router, delegate: delegate)
        self.addChildCoordinator(coordinator)
        return coordinator
    }
    
    func makeMainCoordinator() -> MainCoordinator {
        let coordinator = MainCoordinator(self, self.screenFactory, router)
        self.addChildCoordinator(coordinator)
        return coordinator
    }
    
}
