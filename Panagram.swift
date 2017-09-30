//
//  Panagram.swift
//  Panagram
//
//  Created by Panucci, Julian R on 9/28/17.
//  Copyright © 2017 Panucci, Julian R. All rights reserved.
//

import Foundation


enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        case "q": self = .quit
        default:
            self = .unknown
        }
    }
}

class Panagram {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc
        
        let argument = CommandLine.arguments[1]
        
        let (option, value) = getOption(option: argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
        
        consoleIO.writeMessage("Argument count: \(argCount) Option: \(option) value: \(value)")
        
        
        switch option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            }else {
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            //4
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                //5
                let s = CommandLine.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        //6
        case .help:
            consoleIO.printUsage()
        default:
            //7
            consoleIO.writeMessage("Unknown option \(value)")
            consoleIO.printUsage()
        }
    }
    
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Panagram! This program checks if an input string is an anagram or a palindrome")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' to check for palindromes type 'q' to quit")
            let (option, value) = getOption(option: consoleIO.getInput())
            
            switch option {
            case .anagram:
                //4
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                //5
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.writeMessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            case .help :
                consoleIO.printUsage()
             case .unknown:
                //6
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
    func getOption(option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
}
