import UIKit

extension UIView {
    func rounded(radius: CGFloat = 20) {
        layer.cornerRadius = radius
    }

    func dropShadow(offset: CGSize) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = offset
        layer.shadowRadius = 5

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
    }
}
