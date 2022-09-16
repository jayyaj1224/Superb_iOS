//
//  UIView_Extensions.swift
//  Superb_iOS
//
//  Created by Lee Jong Yun on 2022/09/16.
//

import UIKit

extension UIView {
    func setDropShadow(customLayer: CALayer?=nil, color: UIColor=UIColor.gray, width: CGFloat=1.6, height: CGFloat=2.5, blur radius: CGFloat=3, spread: CGFloat, opacity: Float) {
        let shadowLayer = customLayer ?? self.layer
        
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowOffset = CGSize(width: width, height: height)
        shadowLayer.shadowRadius = radius / 2
        shadowLayer.masksToBounds = false
        shadowLayer.shouldRasterize = true
    }
}
