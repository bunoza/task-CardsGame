//
//  CustomLabel.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 05.08.2021..
//

import UIKit

class CustomLabel : UIView {
    
    let dot = NSAttributedString(string: "", attributes: [.foregroundColor : UIColor.systemRed])
        
    func getLabel1(num : Int) -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        let part1 = NSAttributedString(string: " The deck of cards was successfully assembled after the")
        let string = NSAttributedString(string: String(num), attributes: [.foregroundColor : UIColor.systemRed])
        let part2 = NSAttributedString(string: ". card.")
        let combination = NSMutableAttributedString()
        combination.append(dot)
        combination.append(part1)
        combination.append(NSAttributedString(string: " "))
        combination.append(string)
        combination.append(part2)
        temp.attributedText = combination
        temp.numberOfLines = 0
        return temp
    }
    
    func getLabel2(num : Int) -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        let string = NSAttributedString(string: String(num), attributes: [.foregroundColor : UIColor.systemRed])
        let part2 = NSAttributedString(string: " successful decks of cards. ")
        let combination = NSMutableAttributedString()
        combination.append(dot)
        combination.append(NSAttributedString(string: " "))
        combination.append(string)
        combination.append(part2)
        temp.attributedText = combination
        temp.numberOfLines = 0
        return temp
    }
    
    
    
}
