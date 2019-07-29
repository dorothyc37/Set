//
//  Set.swift
//  Set
//
//  Created by Alexander on 27/07/2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import Foundation

class Set {
    var cards = [Card]()
    
    var score = 0
    var sets = 0
    
    static var firstChosenCard: Card?
    static var secondChosenCard: Card?
    static var thirdChosenCard: Card?
    
    init() {
        for shape in Card.Shape.all {
            for numberOfShapes in Card.NumberOfShapes.all {
                for shading in Card.Shading.all {
                    for color in Card.Color.all {
                        let card = Card(shape: shape, numberOfShapes: numberOfShapes, shading: shading, color: color, isSelected: false, set: false)
                        cards.append(card)
                    }
                }
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if Set.firstChosenCard == nil {
            Set.firstChosenCard = cards[index]
        } else if Set.firstChosenCard != nil, Set.secondChosenCard == nil {
            Set.secondChosenCard = cards[index]
        } else {
            Set.thirdChosenCard = cards[index]
        }
        if Set.firstChosenCard != nil, Set.secondChosenCard != nil, Set.thirdChosenCard != nil {
            isTheseCardsSet(firstCard: Set.firstChosenCard!, secondCard: Set.secondChosenCard!, thirdCard: Set.thirdChosenCard!)
        }
    }
    
    private func isTheseCardsSet(firstCard: Card, secondCard: Card, thirdCard: Card) {
            let resultShapes = compareShapes(firstCardShape: firstCard.shape, secondCardShape: secondCard.shape, thirdCardShape: thirdCard.shape)
            let resultNumberOfShapes = compareNumberOfShapes(firstCardNumberOfShapes: firstCard.numberOfShapes, secondCardNumberOfShapes: secondCard.numberOfShapes, thirdCardNumberOfShapes: thirdCard.numberOfShapes)
            let resultShadings = compareShadings(firstCardShading: firstCard.shading, secondCardShading: secondCard.shading, thirdCardShading: thirdCard.shading)
            let resultColor = compareColor(firstCardColor: firstCard.color, secondCardColor: secondCard.color, thirdCardColor: thirdCard.color)
            if resultShapes == resultNumberOfShapes, resultShapes == resultColor, resultShapes == resultShadings, resultShapes == true {
                print("You found a set!")
                
                cardsToNil()
                sets += 1
                score += 10
            } else {
                print("That's not a set!")
                cardsToNil()
                score -= 5
            }
            
    }
    
}


extension Set {
    
    private func cardsToNil() {
        Set.firstChosenCard = nil
        Set.secondChosenCard = nil
        Set.thirdChosenCard = nil
    }
    
    
    private func compareShapes(firstCardShape: Card.Shape, secondCardShape: Card.Shape, thirdCardShape: Card.Shape) -> Bool {
        if firstCardShape.rawValue == secondCardShape.rawValue, firstCardShape.rawValue == thirdCardShape.rawValue {
            return true
        } else if firstCardShape.rawValue != secondCardShape.rawValue, firstCardShape.rawValue != thirdCardShape.rawValue, secondCardShape.rawValue != thirdCardShape.rawValue {
            return true
        } else {
            return false
        }
    }

    private func compareNumberOfShapes(firstCardNumberOfShapes: Card.NumberOfShapes, secondCardNumberOfShapes: Card.NumberOfShapes, thirdCardNumberOfShapes: Card.NumberOfShapes) -> Bool {
        if firstCardNumberOfShapes.rawValue == secondCardNumberOfShapes.rawValue, firstCardNumberOfShapes.rawValue == thirdCardNumberOfShapes.rawValue {
            return true
        } else if firstCardNumberOfShapes.rawValue != secondCardNumberOfShapes.rawValue, firstCardNumberOfShapes.rawValue != thirdCardNumberOfShapes.rawValue, secondCardNumberOfShapes.rawValue != thirdCardNumberOfShapes.rawValue {
            return true
        } else {
            return false
        }
    }
    
    private func compareShadings(firstCardShading: Card.Shading, secondCardShading: Card.Shading, thirdCardShading: Card.Shading) -> Bool {
        if firstCardShading.rawValue == secondCardShading.rawValue, firstCardShading.rawValue == thirdCardShading.rawValue {
            return true
        } else if firstCardShading.rawValue != secondCardShading.rawValue, firstCardShading.rawValue != thirdCardShading.rawValue, secondCardShading.rawValue != thirdCardShading.rawValue {
            return true
        } else {
            return false
        }
    }
    
    private func compareColor(firstCardColor: Card.Color, secondCardColor: Card.Color, thirdCardColor: Card.Color) -> Bool {
        if firstCardColor.rawValue == secondCardColor.rawValue, firstCardColor.rawValue == thirdCardColor.rawValue {
            return true
        } else if firstCardColor.rawValue != secondCardColor.rawValue, firstCardColor.rawValue != thirdCardColor.rawValue, secondCardColor.rawValue != thirdCardColor.rawValue {
            return true
        } else {
            return false
        }
    }
    
}
