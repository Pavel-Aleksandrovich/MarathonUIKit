//
//  File.swift
//  Task1_GradientAndShadow
//
//  Created by pavel mishanin on 3/2/24.
//

import UIKit

extension UIView {
    
    func addShadow(opacity: Float = 0.8, radius: CGFloat = 10, x: CGFloat = 0, y: CGFloat = 0, color: UIColor = .black) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.masksToBounds = false
    }
    
    func gradientForeground(colors: [UIColor] = [.red, .blue]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = bounds
        
        if let oldLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            oldLayer.removeFromSuperlayer()
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func pinToSuperview(_ subview: UIView) {
         addSubview(subview)
         subview.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             subview.leadingAnchor.constraint(equalTo: leadingAnchor),
             subview.trailingAnchor.constraint(equalTo: trailingAnchor),
             subview.topAnchor.constraint(equalTo: topAnchor),
             subview.bottomAnchor.constraint(equalTo: bottomAnchor),
         ])
     }
}
