// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

/// Extension for CGFloat type providing methods for adjusting width and height.
extension CGFloat {
    /// Method for adjusting width based on iPhone 13 Mini screen width.
    func adjustSizeWidth() -> CGFloat {
        let iPhone13MiniScreenWidth: CGFloat  = 375
        return UIScreen.main.bounds.width / iPhone13MiniScreenWidth
    }
    
    /// Method for adjusting height based on iPhone 13 Mini screen height.
    func adjustSizeHeight() -> CGFloat {
        let iPhone13MiniScreenHeight: CGFloat = 812
        return UIScreen.main.bounds.height / iPhone13MiniScreenHeight
    }
}

/// The `EasyLayout` struct provides convenient methods for managing view layouts in UIKit.
public struct EasyLayout {
    private static let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private static let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    /// Sets constraints for the edges of a view relative to its superview with adjustable insets.
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
    
    /// Sets a constant height constraint for a view.
    public static func heightAnchor(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: constant * coefHeight).isActive = true
    }
    
    /// Sets a height constraint equal to another view's height.
    public static func heightAnchor(view: UIView, equalTo: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalTo: equalTo.heightAnchor).isActive = true
    }
    
    /// Sets a constant width constraint for a view.
    public static func widthAnchor(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: constant * coefWidth).isActive = true
    }
    
    /// Sets a width constraint equal to another view's width.
    public static func widthAnchor(view: UIView, equalTo: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: equalTo.widthAnchor).isActive = true
    }
    
    /// Sets a top constraint for a view relative to a specified anchor point with an adjustable constant.
    public static func topAnchor(view: UIView, toAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: anchor, constant: constant * coefHeight).isActive = true
    }
    
    /// Sets a leading constraint for a view relative to a specified anchor point with an adjustable constant.
    public static func leadingAnchor(view: UIView, toAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: anchor, constant: constant * coefWidth).isActive = true
    }
    
    /// Sets a trailing constraint for a view relative to a specified anchor point with an adjustable constant.
    public static func trailingAnchor(view: UIView, toAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trailingAnchor.constraint(equalTo: anchor, constant: -constant * coefWidth).isActive = true
    }
    
    /// Sets a bottom constraint for a view relative to a specified anchor point with an adjustable constant.
    public static func bottomAnchor(view: UIView, toAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: anchor, constant: -constant * coefHeight).isActive = true
    }
    
    /// Sets a height constraint for a view relative to its superview's height with a given multiplier.
    public static func heightAnchor(view: UIView, multiplier: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    /// Sets a width constraint for a view relative to its superview's width with a given multiplier.
    public static func widthAnchor(view: UIView, multiplier: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: view.superview!.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    /// Sets horizontal centering for a view relative to its superview.
    public static func centerXAnchor(view: UIView, to superview: UIView) {
        view.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    /// Sets vertical centering for a view relative to its superview.
    public static func centerYAnchor(view: UIView, to superview: UIView) {
        view.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
