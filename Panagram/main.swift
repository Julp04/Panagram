//
//  main.swift
//  Panagram
//
//  Created by Panucci, Julian R on 9/28/17.
//  Copyright © 2017 Panucci, Julian R. All rights reserved.
//

import Foundation

let panagram = Panagram()

if CommandLine.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}

