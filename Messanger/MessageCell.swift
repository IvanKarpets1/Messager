
import Foundation
import UIKit

class MessageCell: UITableViewCell{
   
    var messageString = UILabel()
    var messageView = UIView()

    var message: textMessage? {
        didSet{
            messageView.backgroundColor = message?.isComing == true ? .white : .darkGray
            messageString.textColor = message?.isComing == true ? .darkGray : .white
            messageString.text = message?.text
            
            let sideConstraint = message?.isComing == true ? messageString.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-32)) : messageString.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(32))
            NSLayoutConstraint.activate([sideConstraint])
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        messageView.layer.cornerRadius = 12
        messageString.numberOfLines = 0
        
        addSubview(messageView)
        addSubview(messageString)
        
        // let's set constraints
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageString.translatesAutoresizingMaskIntoConstraints = false
        
       
        let constraints = [
            messageView.topAnchor.constraint(equalTo: messageString.topAnchor, constant: CGFloat(-16)),
            messageView.trailingAnchor.constraint(equalTo: messageString.trailingAnchor, constant: CGFloat(16)),
            messageView.bottomAnchor.constraint(equalTo: messageString.bottomAnchor, constant: CGFloat(16)),
            messageView.leadingAnchor.constraint(equalTo: messageString.leadingAnchor, constant: CGFloat(-16)),
            
            messageString.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(32)),
            messageString.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-32)),
            messageString.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
