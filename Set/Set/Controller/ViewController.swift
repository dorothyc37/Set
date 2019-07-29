//
//  ViewController.swift
//  Set
//
//  Created by Alexander on 27/07/2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Set()
    var currentNumberOfCards = 12
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in cardButtons {
            button.layer.cornerRadius = 12.0
        }
        configureCards()
        addCards()
    }
    
    private func createAttributedTextForButton(shape: Card.Shape, numberOfShapes: Card.NumberOfShapes, shading: Card.Shading, color: Card.Color) -> NSAttributedString {
        var text = shape.rawValue + " "
        var myColor: UIColor = .black
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(30)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        for _ in 1..<numberOfShapes.rawValue {
            text += "\(shape.rawValue) "
        }
        
        switch color {
        case .blue: myColor = .blue
        case .green: myColor = .green
        case .red: myColor = .red
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        switch shading {
        case .open:
            return NSAttributedString(string: text, attributes:
                [.paragraphStyle: paragraph, .font: font, .strokeWidth: 10, .strokeColor: myColor])
        case .solid:
            return NSAttributedString(string: text, attributes:
                [.paragraphStyle: paragraph, .foregroundColor : myColor, .font: font])
        case .striped:
            return NSAttributedString(string: text, attributes:
                [.paragraphStyle: paragraph, .foregroundColor : myColor.withAlphaComponent(0.2), .font: font, .strokeWidth: -5, .strokeColor: myColor])
            
        }
    }
    
    private func addCards() {
        for index in cardButtons.indices {
            cardButtons[index].isHidden = true
            if index < currentNumberOfCards {
                cardButtons[index].isHidden = false
            }
        }
    }
    
    private func configureCards() {
        game.cards.shuffle()
        for index in cardButtons.indices {
            let card = game.cards[index]
            let attributedTitle = createAttributedTextForButton(shape: card.shape, numberOfShapes: card.numberOfShapes, shading: card.shading, color: card.color)
            cardButtons[index].setAttributedTitle(attributedTitle, for: .normal)
        }
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            game.cards[cardNumber].isSelected = !game.cards[cardNumber].isSelected
//            if game.cards[cardNumber].isSelected {
//                cardButtons[cardNumber].layer.borderWidth = 5
//                cardButtons[cardNumber].layer.borderColor = UIColor.blue.cgColor
//            } else {
//                cardButtons[cardNumber].layer.borderWidth = 0
//            }
        }
        setsLabel.text = "Sets: \(game.sets)"
        scoreLabel.text = "Score: \(game.score)"
    }
    
    
    @IBAction func newGameAction(_ sender: UIButton) {
        currentNumberOfCards = 12
        addCards()
        configureCards()
        game.score = 0
        game.sets = 0
    }
    

    @IBAction func addCardsAction(_ sender: UIButton) {
        currentNumberOfCards += 3
        addCards()
    }
    
}

