/// The mathematical operators.
///
/// This enum represents the basic arithmetic operations supported by the calculator.
/// Conforms to `CustomStringConvertible` for easy description.
enum MathematicalOperator: CustomStringConvertible {
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
    
    func operate<NumberType: Numeric & LosslessStringConvertible & BinaryFloatingPoint>(_ lhs: NumberType, _ rhs: NumberType) -> NumberType {
        func run(_ operation: (NumberType, NumberType) -> NumberType) -> NumberType {
            return operation(lhs, rhs)
        }
        
        switch self {
        case .addition:
            return run(+)
        case .subtraction:
            return run(-)
        case .multiplication:
            return run(*)
        case .division:
            return run(/)
        }
    }
}
