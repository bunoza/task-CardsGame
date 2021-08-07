//
//  CardsDisplayController.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 04.08.2021..
//

import UIKit

class CardsDisplayController : UIViewController  {

    var sequence = [Int]()
    var deckCompletedAfter : Int = 0
    
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
    }()
    
    init(sequence : [Int], deckCompletedAfter : Int) {
        self.sequence = sequence
        self.deckCompletedAfter = deckCompletedAfter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
     
    override func viewDidLoad() {
        setUpTitle()
        setUpViews()
    }
    
    func setUpTitle() -> Void {
        view.backgroundColor = .white
        self.navigationItem.title = "Number of decks of cards";
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
    }
    
    func setUpViews() -> Void {
        let customLabelProvider = CustomLabel()
        let label1 = customLabelProvider.getLabel1(num: deckCompletedAfter)
        let label2 = customLabelProvider.getLabel2(num: sequence.reduce(Int.max, { min($0, $1) }))

        let bigStack = BigResultStackView().getWholeContent(cards: CardView().getCardSequence(seq: self.sequence))
        
        let views = [label1, label2]
        addSubviews(views)
        view.addSubview(scrollView)
        scrollView.addSubview(bigStack)
        addConstraints(views)
        
        NSLayoutConstraint.activate([
            bigStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            bigStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            bigStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bigStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            bigStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
    }
    
    func addSubviews(_ views: [UIView]) {
        for oneView in views {
            view.addSubview(oneView)
        }
    }
    
    func addConstraints(_ views: [UIView]){
            NSLayoutConstraint.activate([
                views[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                views[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                views[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                views[1].topAnchor.constraint(equalTo: views[0].bottomAnchor, constant: 30),
                views[1].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                views[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                scrollView.topAnchor.constraint(equalTo: views[1].bottomAnchor, constant: 30),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
            ])
        
    }
}


