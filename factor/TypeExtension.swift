//
//  TypeExtension.swift
//  factor
//
//  Created by Jayson Kish on 5/30/23.
//

extension Int {
    
    // - MARK: Properties
    
    /// Returns a set containing the factors of `self`.
    public var factors: Set<Int> {
        var factors = Set<Int>()
        for number in 1...self where self.isMultiple(of: number) {
            factors.insert(number)
        }
        return factors
    }

    // - MARK: Functions
    
    /// Returns the common factors between `self` and `number`.
    /// - Parameter number: The integer to operate.
    /// - Returns: The common factors between `self` and `number`.
    public func commonFactors(with number: Int) -> Set<Int> {
        return Set(self.factors).intersection(Set(number.factors))
    }
    
    
    /// Returns the greatest common factor between `self` and `number`.
    /// - Parameter number: The integer to operate.
    /// - Returns: The greatest common factor between `self` and `number`.
    public func greatestCommonFactor(with number: Int) -> Int {
        return self.commonFactors(with: number).max()!
    }
    
    
    /// Returns the least common multiple between `self` and `number`.
    /// - Parameter number: The integer to operate.
    /// - Returns: The least common multiple between `self` and `number`.
    public func leastCommonMultiple(with number: Int) -> Int {
        return (self * number) / self.greatestCommonFactor(with: number)
    }
    
}
