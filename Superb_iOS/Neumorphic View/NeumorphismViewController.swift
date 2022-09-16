//
//  NeumorphismViewController.swift
//  Superb_iOS
//
//  Created by Lee Jong Yun on 2022/09/16.
//

import UIKit

class NeumorphismViewController: UIViewController {
    private let bar: NeumorphicView = {
        let view = NeumorphicView(color: .crayon, shadowSize: .small)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let square: NeumorphicView = {
        let view = NeumorphicView(color: .crayon, shadowSize: .medium)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let circle: NeumorphicView = {
        let view = NeumorphicView(color: .crayon, shadowSize: .large)
        view.layer.cornerRadius = 50
        return view
    }()
    
    private lazy var smallLabel: UILabel = makeDescriptionLabel(title: "Small Shadow")
    
    private lazy var mediumLabel: UILabel = makeDescriptionLabel(title: "Medium Shadow")
    
    private lazy var largeLabel: UILabel = makeDescriptionLabel(title: "Large Shadow")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        layout()
    }
    
    private func setupView() {
        view.backgroundColor = .crayon
    }
    
    private func makeDescriptionLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }
    
    private func layout() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 100
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        [bar, square, circle]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        bar.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.width.equalTo(300)
        }
        
        square.snp.makeConstraints { make in
            make.size.equalTo(170)
        }
        
        circle.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        
        [smallLabel, mediumLabel, largeLabel]
            .forEach {
                stackView.addSubview($0)
            }
        
        smallLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bar.snp.top).offset(-5)
        }
        
        mediumLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(square.snp.top).offset(-7)
        }
        
        largeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(circle.snp.top).offset(-10)
        }
    }
}

