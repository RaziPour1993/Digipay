import Foundation

protocol CoordinatorFactory: class {
    
    func makeLoginCoordinator(_ router: Router, delegate: LoginCoordinatorDelegate)-> LoginCoordinator
    
    /// Child Coordinators
    var childCoordinators: [Coordinator] { get set }
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
    
}

extension CoordinatorFactory {
    
    public func addChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }
    
    public func removeChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
    
}
