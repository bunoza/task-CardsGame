//
//  CardView.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 05.08.2021..
//

import UIKit

class CardView : UIView {
    
    init(orderNum: Int, num : Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getUIImageView( imageName : String) -> UIImageView{
        let name = "Group (" + imageName + ")"
        let temp = UIImageView(image: UIImage.resizeImage(image: UIImage(named: name)!, targetSize: CGSize(width: 80.0, height: 80.0)))
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    
    func getLabel(num : Int) -> UILabel {
        let temp = UILabel()
        let tempString = String(num)
        temp.attributedText = NSAttributedString(string: " " + String(num) + " ", attributes:  [.foregroundColor : UIColor.systemRed])
        temp.layer.backgroundColor = UIColor.black.cgColor
        temp.layer.cornerRadius = temp.font.pointSize * CGFloat(tempString.count) / 2
        temp.layer.masksToBounds = true
        temp.clipsToBounds = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    
    func getCardSequence(seq : [Int]) -> [CardView]{
        var cardviews = [CardView()]
        for i in 0...51 {
            cardviews.append(self.getCardView(orderNum: i + 2, num: seq[i]))
        }
        return cardviews
    }
    
    func getCardView(orderNum: Int, num : Int) -> CardView {
        let temp = CardView()
        let image = getUIImageView(imageName: String(orderNum))
        let label = getLabel(num: num)
        let views = [image, label]
        temp.addSubviews(views)
        temp.setUpConstraints(views)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    
    func addSubviews(_ views: [UIView]) {
        for oneView in views {
            self.addSubview(oneView)
        }
    }
    
    func setUpConstraints(_ views: [UIView]){
            NSLayoutConstraint.activate([
                views[0].topAnchor.constraint(equalTo: self.topAnchor),
                views[0].trailingAnchor.constraint(equalTo: self.trailingAnchor),
                views[0].leadingAnchor.constraint(equalTo: self.leadingAnchor),
                views[0].bottomAnchor.constraint(equalTo: self.bottomAnchor),
                views[1].centerXAnchor.constraint(equalTo: self.centerXAnchor),
                views[1].centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        }
    
}
