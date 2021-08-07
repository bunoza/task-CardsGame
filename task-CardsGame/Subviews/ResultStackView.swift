//
//  ResultStackView.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 05.08.2021..
//

import UIKit

class ResultStackView : UIView {
    
    var stackView: UIStackView = {
           let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            return stackView
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    func getStackView() -> UIStackView {
        return stackView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addCardView(cardView : CardView) -> Void {
        stackView.addArrangedSubview(cardView)
    }
    
    func setUpView() -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
    }
    
    func setUpConstraints() -> Void {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
