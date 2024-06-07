// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

extension CGFloat {
    func adjustSizeWidth() -> CGFloat {
        let iPhone13MiniScreenWidth: CGFloat  = 375
        return UIScreen.main.bounds.width / iPhone13MiniScreenWidth
    }
    
    func adjustSizeHeight() -> CGFloat {
        let iPhone13MiniScreenHeight: CGFloat = 812
        return UIScreen.main.bounds.height / iPhone13MiniScreenHeight
    }
}

public struct EasyLayout {
    private static let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private static let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    public static func edgeInsets(view: UIView, to superview: UIView, top: CGFloat?, leading: CGFloat?, trailing: CGFloat?, bottom: CGFloat?) {
        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if let top = top {
            constraints.append(view.topAnchor.constraint(equalTo: superview.topAnchor, constant: top * coefHeight))
            print()
        }
        if let leading = leading {
            constraints.append(view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading * coefWidth))
        }
        if let trailing = trailing {
            constraints.append(view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -trailing * coefWidth))
        }
        if let bottom = bottom {
            constraints.append(view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom * coefHeight))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIView {
    func edgeInsets(to superview: UIView, top: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, bottom: CGFloat? = nil) {
        EasyLayout.edgeInsets(view: self, to: superview, top: top, leading: leading, trailing: trailing, bottom: bottom)
    }
}
