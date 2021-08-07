//
//  BigResultStackView.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 05.08.2021..
//

import UIKit

class BigResultStackView : UIView {
    
    var stackView: UIStackView = {
           let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 15
        stackView.distribution = .fill
            return stackView
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    func getWholeContent(cards: [CardView]) -> BigResultStackView {
        let bigStack = BigResultStackView()
        for i in 0...10{
            let stack = ResultStackView()
            for j in 0...4{
                if i * 5 + j + 1 < 53 {
                    stack.addCardView(cardView: cards[i * 5 + j + 1])
                }else{
                    stack.addCardView(cardView: CardView())
                }
            }
            bigStack.addStackView(stackview: stack.getStackView())
        }
        return bigStack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addStackView(stackview : UIStackView) -> Void {
        stackView.addArrangedSubview(stackview)
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

