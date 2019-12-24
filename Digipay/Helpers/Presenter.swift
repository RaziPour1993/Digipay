import Foundation
import UIKit

protocol PresentingView {
    func willLoadingData()
    func didLoadingData()
    func warning(message: String)
}

protocol Presenter: class {
    func present()
}

extension PresentingView where Self: UIViewController {
    
    func willLoadingData() {
        
    }
    
    func didLoadingData() {
        
    }
    
    func warning(message: String) {
        print(message)
    }
    
}
