//
//  main.swift
//  factor
//
//  Created by Jayson Kish on 5/30/23.
//

import ArgumentParser

@main
struct Factor: ParsableCommand {
    
    // - MARK: Properties
    
    static var configuration = CommandConfiguration(
        abstract: "Print the factors of one or more integers.",
        version: "2.0")
    
    @Argument(
        help: "The integers to factorise.")
    var integers: [Int] = []
    
    @Flag(
        name: .customLong("lcm"),
        help: "Print the least common multiple.")
    var leastCommonMultiple = false
    
    // - MARK: Program
    
    mutating func run() {
        if leastCommonMultiple {
            getLeastCommonMultiple(of: Set(integers))
        } else {
            getFactors(of: Set(integers))
        }
    }
}

// MARK: Functions

/// Finds the factors of a set of integers.
/// - Parameter numbers: The integers to factorize.
func getFactors(of numbers: Set<Int>) {
    for number in numbers.sorted() {
        print(number.factors.sorted())
    }
}

/// Finds the least common multiple between a set of integers.
/// - Parameter numbers: The integers to operate.
func getLeastCommonMultiple(of numbers: Set<Int>) {
    guard let first = numbers.first else {
        return
    }
    print(numbers.dropFirst().reduce(first) { $0.leastCommonMultiple(with: $1) })
}
