import UIKit

class RetryView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    var message: String? {
        set{ self.messageLabel.text = newValue?.localized }
        get { return self.messageLabel.text }
    }
    
    var retryTaped: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    
    func config(){
        retryButton.addTarget(self, action: #selector(retryButtonAction), for: .touchDown)
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3254901171, blue: 0.3137254119, alpha: 1)
    }
    
    
    @objc func retryButtonAction(){
        retryTaped?()
    }
    
    deinit {
        print("deinit RetryView")
    }
    
}
