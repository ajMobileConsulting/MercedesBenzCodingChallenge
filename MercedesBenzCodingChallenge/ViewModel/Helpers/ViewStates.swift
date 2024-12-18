//
//  ViewStates.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

enum ViewStates: Equatable {
    case loading
    case load
    case error(message: String)
    case empty
}
