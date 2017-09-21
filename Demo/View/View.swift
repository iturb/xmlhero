import UIKit

class View:UIView
{
    private(set) weak var textView:UITextView!
    private let kInsetsVertical:CGFloat = 10
    private let kInsetsHorizontal:CGFloat = 20
    private let kFontSize:CGFloat = 22
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        let textView:UITextView = UITextView()
        textView.isEditable = false
        textView.clipsToBounds = true
        textView.font = UIFont.systemFont(ofSize:kFontSize)
        textView.textColor = UIColor.black
        textView.alwaysBounceVertical = true
        textView.alwaysBounceHorizontal = true
        textView.contentInset = UIEdgeInsets(
            top:kInsetsVertical,
            left:kInsetsHorizontal,
            bottom:-kInsetsVertical,
            right:-kInsetsHorizontal)
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView = textView
        
        addSubview(textView)
        
        NSLayoutConstraint(
            item:textView,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.top,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:textView,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.bottom,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:textView,
            attribute:NSLayoutAttribute.left,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.left,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:textView,
            attribute:NSLayoutAttribute.right,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.right,
            multiplier:1,
            constant:0).isActive = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
