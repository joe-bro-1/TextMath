/// A tree similar to a binary tree but for holding equations.
///
/// In this tree structure you can have either a number or something that can be a number; hence the conformance to `CanBeNumber`
struct EquationTree<NumberType: Numeric & LosslessStringConvertible & BinaryFloatingPoint> {
    /// The branches below
    // we use `Optional<T>` so we need to manually provide nil when we want it empty and we cant just leave it alone;
    var branches: Optional<TreeNode<NumberType>>

    /// Any unbroken chunks that need to get their own branches
    // now that i think about it maybe this should be on `TreeNode` and branches shouldn't be optional
    var unbrokenMath: [MathematicalChunk<NumberType>]

    init(with unbrokenMath: [MathematicalChunk<NumberType>]) {
        self.unbrokenMath = unbrokenMath
        self.branches = nil
    }
}

enum TreeNode<NumberType: Numeric & LosslessStringConvertible & BinaryFloatingPoint>: NumericRepresentation {
    indirect case branch(TreeNode, MathematicalOperator, TreeNode)
    case number(NumberType)

    func asNumber() -> NumberType {
        switch self {
        case .branch(let lhs, let mathematicalOperator, let rhs):
            return mathematicalOperator.operate(lhs.asNumber(), rhs.asNumber())
        case .number(let number):
            return number
        }
    }
}

/// Something that can be a number even if it is not one yet
protocol NumericRepresentation {
    associatedtype NumberType: Numeric

    /// Calculates the number represented.
    /// - Returns: The number stored within.
    func asNumber() -> NumberType
}
