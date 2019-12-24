import Foundation

final class MainCoordinatorFactory: CoordinatorFactory {
    
    init() { self.childCoordinators = [] }
    var childCoordinators: [Coordinator]
}
