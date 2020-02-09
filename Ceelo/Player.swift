//
//  Player.swift
//  Ceelo
//
//  Created by Ethan Uzarowski on 2/8/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import SwiftUI

class Player {
    var firstRoll = -1
    var score = -1
    
    func hasRolledFirst() -> Bool {
        return firstRoll != -1
    }
    
    func hasRolled() -> Bool {
        return score != -1
    }
}
