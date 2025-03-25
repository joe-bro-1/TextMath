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
    private func split(mathText: String) -> [MathematicalChunk<NumberType>] {
        let split = mathText.split(separator: " ")
        return split.compactMap { section in
            chunk(from: String(section))
        }
    }
    
    /// Converts a string value into a mathematical chunk.
    ///
    /// This method attempts to parse a string into either a number or a mathematical operator.
    ///
    /// - Parameter value: The string to be converted into a mathematical chunk.
    /// - Returns: A `MathematicalChunk` if the conversion is successful, `nil` otherwise.
    /// - Note: Supports multiple representations of operators (e.g. * and x etc. for multiplication) for flexibility.
    private func chunk(from value: String) -> MathematicalChunk<NumberType>? {
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
}
