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
    
    public static func edgeInsets(view: UIView, to superview: UIView, top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: superview.topAnchor, constant: top * coefHeight),
                view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading * coefWidth),
                view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -trailing * coefWidth),
                view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom * coefHeight)
            ]
        )
    }
    
    public static func heightAnchor(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: constant * coefHeight).isActive = true
    }
    
    public static func heightAnchor(view: UIView, equalTo: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalTo: equalTo.heightAnchor).isActive = true
    }
    
    public static func widthAnchor(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: constant * coefWidth).isActive = true
    }
    
    public static func widthAnchor(view: UIView, equalTo: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: equalTo.widthAnchor).isActive = true
    }
    
    public static func topAnchor(view: UIView, toAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: anchor, constant: constant * coefHeight).isActive = true
    }
    
    public static func leadingAnchor(view: UIView, toAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat) {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(equalTo: anchor, constant: constant * coefWidth).isActive = true
    }

    public static func trailingAnchor(view: UIView, toAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trailingAnchor.constraint(equalTo: anchor, constant: -constant * coefWidth).isActive = true
    }

    public static func bottomAnchor(view: UIView, toAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: anchor, constant: -constant * coefHeight).isActive = true
    }


}


