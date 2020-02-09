//
//  Die.swift
//  Ceelo
//
//  Created by Ethan Uzarowski on 2/8/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import SwiftUI

struct Die : View {
    var result: Int
    var body: some View {
        if (result == -1) {
            return Image("DieResult-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0) // Hide image
        }
        else {
            return Image("DieResult-\(result)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(1) // Show image
        }
    }
}

func getScoreText(score: Int) -> String {
    if (score == 100) {
        return "4-5-6"
    }
    else if (score == 0) {
        return "1-2-3"
    }
    else if (score > 6) {
        return "Triple \(score/10)"
    }
    else if (score >= 1 && score <= 6) {
        return "\(score)"
    }
    else {
        return "Invalid roll"
    }
}
