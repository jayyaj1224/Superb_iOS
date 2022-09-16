//
//  HomeViewController.swift
//  Superb_iOS
//
//  Created by Lee Jong Yun on 2022/09/16.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Superb iOS"
        label.font = .systemFont(ofSize: 20, weight: .bold)
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
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        layoutView()
        
        addMenuButton(title: "Neumorphism", vc: NeumorphismViewController())
        addMenuButton(title: "Hello World", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
        addMenuButton(title: "Other", vc: UIViewController())
    }
    
    private func layoutView() {
        [label, menuScrollView].forEach {
            view.addSubview($0)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(80)
        }
        
        menuScrollView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        menuScrollView.addSubview(menuStackView)
        menuStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func addMenuButton(title: String, vc: UIViewController) {
        let button = UIButton()
        
        let attributedString = NSMutableAttributedString(
            string: title,
            attributes: [
                NSMutableAttributedString.Key.foregroundColor: UIColor.black,
                NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)
            ]
        )
        button.setAttributedTitle(attributedString, for: .normal)
        
        button.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        menuStackView.addArrangedSubview(button)
        
        button.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(120)
        }
    }
}

