//
//  StoryboardFactory.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class StoryboardFactory {
    static func instantiate(name: String) -> UIViewController? {
        let story = UIStoryboard.init(name: name, bundle: nil)
        return story.instantiateInitialViewController()
    }
}
