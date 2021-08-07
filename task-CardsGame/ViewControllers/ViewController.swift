//
//  ViewController.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 04.08.2021..
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIViewControllerTransitioningDelegate {
    
    var textField : UITextField = UITextField()
    
    func getUIImageView( imageName : String) -> UIImageView{
        let temp = UIImageView(image: UIImage.resizeImage(image: UIImage(named: imageName)!, targetSize: CGSize(width: 120.0, height: 120.0)))
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    
    func getTextField() -> UITextField {
        let textFieldTemp = UITextField()
        textFieldTemp.translatesAutoresizingMaskIntoConstraints = false
        textFieldTemp.backgroundColor = .systemGray6
        textFieldTemp.font = UIFont(name: "Arial", size: 25)
        textFieldTemp.setLeftPaddingPoints(10)
        textFieldTemp.setRightPaddingPoints(10)
        textFieldTemp.textAlignment = .center
        textFieldTemp.borderStyle = .none
        textFieldTemp.layer.masksToBounds = true;
        textFieldTemp.layer.borderColor = UIColor.red.cgColor
        textFieldTemp.adjustsFontSizeToFitWidth = true
        textFieldTemp.layer.borderWidth = 1.0
        textFieldTemp.layer.cornerRadius = 5.0
        return textFieldTemp
    }
    
    var label : UILabel = {
        let temp = UILabel()
        temp.text = "Enter a three-digit or larger number"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    var alert : UIAlertController = {
        let temp = UIAlertController(title: "", message: "", preferredStyle: .alert)
        temp.view.backgroundColor = .white
        temp.view.layer.cornerRadius = 10.0
        let title = NSAttributedString(string: "INCORRECT ENTRY", attributes: [.font : UIFont(name: "Avenir Next Condensed Bold", size: 20)!])
        let message = NSAttributedString(string: "The number you are entering must be at least three-digit.", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
        let alertAction = UIAlertAction(title: "Try again", style: .destructive, handler: nil)
        temp.addAction(alertAction)
        temp.setValue(title, forKey: "attributedTitle")
        temp.setValue(message, forKey: "attributedMessage")
        return temp
    }()

    var button : UIButton =  {
        let temp = UIButton()
        temp.backgroundColor = .systemRed
        let attributedTitle = NSAttributedString(string: " GAMBLE ", attributes: [.font : UIFont(name: "Avenir Next Condensed Bold", size: 22)!, .foregroundColor : UIColor.white])
        temp.layer.cornerRadius = 25
        temp.setAttributedTitle(attributedTitle, for: .normal)
        temp.addTarget(self, action: #selector(click(_sender:)), for: .touchUpInside)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setImage(UIImage.resizeImage(image: UIImage(named: "die")!, targetSize: CGSize(width: 40.0, height: 40.0)), for: .normal)
        return temp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        setUpViews()
    }
    
    func setUpTitle() -> Void {
        view.backgroundColor = .white
        self.navigationItem.title = "Number of decks of cards";
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
    }

    func setUpViews(){
        textField = getTextField()
        textField.delegate = self
        let views = [getUIImageView(imageName: "Group (53)"), textField, label, button]
        addSubviews(views)
        setUpConstraints(views)
    }
    
    func setUpConstraints(_ views: [UIView]){
            NSLayoutConstraint.activate([
                views[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                views[0].centerXAnchor.constraint(equalTo: view.centerXAnchor),
                views[1].topAnchor.constraint(equalTo: views[0].bottomAnchor, constant: 30),
                views[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
                views[1].widthAnchor.constraint(equalToConstant: 100),
                views[1].heightAnchor.constraint(equalToConstant: 50),
                views[2].topAnchor.constraint(equalTo: views[1].bottomAnchor, constant: 20),
                views[2].centerXAnchor.constraint(equalTo: view.centerXAnchor),
                views[3].topAnchor.constraint(equalTo: views[2].bottomAnchor, constant: 20),
                views[3].centerXAnchor.constraint(equalTo: view.centerXAnchor),
                views[3].widthAnchor.constraint(equalToConstant: 140),
                views[3].heightAnchor.constraint(equalToConstant: 50),
            ])
        }
    
    func addSubviews(_ views: [UIView]) {
        for oneView in views {
            view.addSubview(oneView)
        }
    }
    
    @objc func click(_sender: UIButton!) -> Void {
        if textField.text!.count >= 3 {
            let game = CardsGame(userInput: textField.text!)
            let cardsDisplay = CardsDisplayController(sequence: game.getSequence(), deckCompletedAfter: game.getDeckCompletedAfter())
            showCardsDisplay(controller: cardsDisplay)
        }
        else{
            showAlert()
        }
    }
    
    func showAlert() -> Void {
        self.present(alert, animated: true, completion: nil)
    }
    
    func showCardsDisplay(controller: CardsDisplayController) -> Void {
        controller.modalPresentationStyle = .overCurrentContext
        controller.transitioningDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                return string == "" || Int(string) != nil
    }
    
}

