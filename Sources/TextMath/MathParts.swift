import Foundation

/// A chunk in a mathematical expression.
///
/// A mathematical chunk can be either a number or a mathematical operator.
enum MathematicalChunk<NumberType: Numeric & LosslessStringConvertible & BinaryFloatingPoint>: CustomStringConvertible {
    /// A numeric value.
    case number(NumberType)

    /// A mathematical operator.
    case MathematicalOperator(MathematicalOperator)

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

