import Foundation

/// A chunk in a mathematical expression.
///
/// A mathematical chunk can be either a number or a mathematical operator.
internal enum MathematicalChunk<NumberType: Numeric & LosslessStringConvertible>: CustomStringConvertible {
    /// A numeric value.
    case number(NumberType)

    /// A mathematical operator.
    case MathematicalOperator(MathematicalOperators)

    /// A textual representation of the chunk.
    var description: String {
        switch self {
        case .number(let number):
            return String(number)
        case .MathematicalOperator(let mathematicalOperators):
            return mathematicalOperators.description
        }
    }
}

/// The mathematical operators.
///
/// This enum represents the basic arithmetic operations supported by the calculator.
/// Conforms to `CustomStringConvertible` for easy description.
internal enum MathematicalOperators: CustomStringConvertible {
    /// Addition operation.
    case addition
    
    /// Subtraction operation.
    case subtraction
    
    /// Multiplication operation.
    case multiplication
    
    /// Division operation.
    case division
    
    /// A textual representation of the operator.
    var description: String {
        switch self {
        case .addition:
            "+"
        case .subtraction:
            "-"
        case .multiplication:
            "*"
        case .division:
            "/"
        }
    }
    }
