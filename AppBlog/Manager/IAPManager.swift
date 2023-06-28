//
//  IAPManager.swift
//  AppBlog
//
//  Created by Filipe Boeck on 22/06/23.
//

import Foundation
import Purchases

//se pa tirar
import StoreKit

final class IAPManager {
    static let shared = IAPManager()
    
    private init() {}
    
    func isPremium() -> Bool {
        return false
    }
}
