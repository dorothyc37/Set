//
//  Card.swift
//  Set
//
//  Created by Alexander on 27/07/2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible, Equatable {
    private(set) var shape: Shape
    private(set) var numberOfShapes: NumberOfShapes
    private(set) var shading: Shading
    private(set) var color: Color
    var isSelected = false
    var set = false
    
    var description: String {
        return "\(shape) \(numberOfShapes) \(shading) \(color)"
    }

}

extension Card {
    enum Shape: String, CustomStringConvertible {
        var description: String {
            return rawValue
        }
        case triangle = "▲"
        case square = "■"
        case circle = "●"
        static var all = [Shape.triangle, .square, .circle]
    }
    
    enum NumberOfShapes: Int, CustomStringConvertible {
        var description: String {
            return String(rawValue)
        }
        case one = 1
        case two
        case three
        static var all = [NumberOfShapes.one, .two, .three]
    }
    enum Shading: String, CustomStringConvertible {
        var description: String {
            return rawValue
        }
        case solid
        case striped
        case open
        static var all = [Shading.solid, .striped, .open]
    }
    enum Color: String, CustomStringConvertible {
        var description: String {
            return rawValue
        }
        case red
        case green
        case blue
        static var all = [Color.red, .green, .blue]
    }
}

