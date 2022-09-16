//
//  HomeViewController.swift
//  Superb_iOS
//
//  Created by Lee Jong Yun on 2022/09/16.
//

import UIKit

class HomeViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Superb iOS"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let menuScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        layoutView()
    }
    
    private func layoutView() {
        [label, menuScrollView].forEach {
            view.addSubview($0)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        menuScrollView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(100)
            make.bottom.equalToSuperview()
        }
        
        menuScrollView.addSubview(menuStackView)
        menuStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func addMenuButton(title: String, vc: UIViewController) {
        
    }
}

