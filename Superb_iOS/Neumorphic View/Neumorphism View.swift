//
//  Neumorphism View.swift
//  Superb_iOS
//
//  Created by Lee Jong Yun on 2022/09/16.
//

import UIKit

/// UIView with Neumorphism Shadow
/// *     init(color: UIColor, shadowSize: ShadowSize)
/// *     enum NeumorphicSize { case small, medium, large }
///
class NeumorphicView: UIView {
    enum ShadowSize {
        case small, medium, large
    }
    
    private let upperWhiteShadowLayer = CALayer()
    
    private let underBlackShadowLayer = CALayer()
    
    init(color: UIColor, shadowSize: ShadowSize) {
        super.init(frame: .zero)
        backgroundColor = color
        
        [upperWhiteShadowLayer, underBlackShadowLayer].forEach { shadowLayer in
            shadowLayer.backgroundColor = color.cgColor
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
        
        setNeumorphicShadow(at: [upperWhiteShadowLayer, underBlackShadowLayer], shadowSize: shadowSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [upperWhiteShadowLayer, underBlackShadowLayer].forEach { layer in
            layer.frame = self.layer.bounds
            layer.cornerRadius = self.layer.cornerRadius
        }
    }

    private func setNeumorphicShadow(at layers: [CALayer], shadowSize: ShadowSize) {
        let upperShadowLayer = layers[0], underShadowLayer = layers[1]
        
        switch shadowSize {
        case .small:
            setDropShadow(customLayer: underShadowLayer, color: .black, width: 1, height: 1, blur: 1, spread: -1, opacity: 0.4)
            setDropShadow(customLayer: upperShadowLayer, color: .white, width: -3, height: -3, blur: 2, spread: 3, opacity: 0.8)
        case .medium:
            setDropShadow(customLayer: underShadowLayer, color: .black, width: 4, height: 4, blur: 6, spread: -3, opacity: 0.2)
            setDropShadow(customLayer: upperShadowLayer, color: .white, width: -6, height: -6, blur: 8, spread: 2, opacity: 0.7)
        case .large:
            setDropShadow(customLayer: underShadowLayer, color: .black, width: 10, height: 10, blur: 8, spread: 4, opacity: 0.25)
            setDropShadow(customLayer: upperShadowLayer, color: .white, width: -9, height: -9, blur: 8, spread: 5, opacity: 0.9)
        }
    }
}
