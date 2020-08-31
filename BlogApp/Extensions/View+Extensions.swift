//
//  View+Extensions.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/30/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
