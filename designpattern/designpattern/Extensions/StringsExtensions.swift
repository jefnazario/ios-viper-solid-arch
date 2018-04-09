//
//  StringsExtensions.swift
//  designpattern
//
//  Created by Jeferson Nazario on 14/03/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

import Foundation

extension String {
    func translate() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
