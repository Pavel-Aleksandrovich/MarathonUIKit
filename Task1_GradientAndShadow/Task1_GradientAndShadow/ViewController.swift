//
//  ViewController.swift
//  Task1_GradientAndShadow
//
//  Created by pavel mishanin on 3/2/24.
//

import UIKit

final class GradientAndShadowView: UIView {
    
    private let roundedView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        roundedView.layer.cornerRadius = 10
        roundedView.clipsToBounds = true

        pinToSuperview(roundedView)
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedView.gradientForeground()
    }
}

final class ViewController: UIViewController {

    private let rectangleView = GradientAndShadowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
  
        view.addSubview(rectangleView)
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            rectangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectangleView.widthAnchor.constraint(equalToConstant: 100),
            rectangleView.heightAnchor.constraint(equalTo: rectangleView.widthAnchor)
        ])
    }
}

