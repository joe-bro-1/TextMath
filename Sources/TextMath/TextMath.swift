// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A calculator that solves mathematical expressions by breaking them down and evaluating their components.
///
/// The `Calculator` transforms text-based mathematical expressions into computed results,
/// handling basic arithmetic operations with precision and flexibility.
///
/// - Solves arithmetic expressions
/// - Supports multiple operator representations
/// - Provides a robust foundation for mathematical computation
struct Calculator<NumberType: Numeric & LosslessStringConvertible> {
    public func evaluate(_ expression: String) -> NumberType {
        #warning("Incomplete")
        return 5
    }
    
    /// Splits a mathematical expression into an array of mathematical chunks.
    ///
    /// This private method breaks down the input text into meaningful mathematical components.
    ///
    /// - Parameter mathText: The input mathematical expression as a string.
    /// - Returns: An array of `MathematicalChunk` representing numbers and operators.
    private func split(mathText: String) -> [MathematicalChunk] {
        let split = mathText.split(separator: " ")
        return split.compactMap { section in
            chunk(from: String(section))
        }
    }
    
    /// Represents a chunk in a mathematical expression.
    ///
    /// A mathematical chunk can be either a number or a mathematical operator.
    private enum MathematicalChunk: CustomStringConvertible {
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
    
    /// Converts a string value into a mathematical chunk.
    ///
    /// This method attempts to parse a string into either a number or a mathematical operator.
    ///
    /// - Parameter value: The string to be converted into a mathematical chunk.
    /// - Returns: A `MathematicalChunk` if the conversion is successful, `nil` otherwise.
    /// - Note: Supports multiple representations of operators (e.g. * and x etc. for multiplication) for flexibility.
    private func chunk(from value: String) -> MathematicalChunk? {
        if let number = NumberType(value) {
            return .number(number)
        }
        
        switch value.lowercased() {
        case "+":
            return .MathematicalOperator(.addition)
        case "-", "–":
            return .MathematicalOperator(.subtraction)
        case "*", "x", "•":
            return .MathematicalOperator(.multiplication)
        case "/", "÷":
            return .MathematicalOperator(.division)
        default:
            return nil
        }
    }
    
    /// Defines the supported mathematical operators.
    ///
    /// This enum represents the basic arithmetic operations supported by the calculator.
    /// Conforms to `CustomStringConvertible` for easy description.
    private enum MathematicalOperators: CustomStringConvertible {
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
}
