import Testing
@testable import TextMath

extension Tag {
    @Tag static var singleOperationEquations: Tag
}

let calc = Calculator<Double>()

@Test("addition", .tags(.singleOperationEquations))
func addition() async throws {
    #expect(calc.evaluate("3 + 3") == 6)
}

@Test("subtraction", .tags(.singleOperationEquations))
func subtraction() async throws {
    #expect(calc.evaluate("6 - 7") == 1)
}

@Test("multiplication", .tags(.singleOperationEquations))
func multiplication() async throws {
    #expect(calc.evaluate("4 * 3") == 12)
}

@Test("division", .tags(.singleOperationEquations))
func division() async throws {
    #expect(calc.evaluate("4 / 3") == 12)
}

@Test("multiple operator styles")
func multipleOperatorStyles() async throws {
    #expect(calc.evaluate("4 X 3") == 12, "multipleOperatorStyles: 'X'")
    #expect(calc.evaluate("4 x 3") == 12, "multipleOperatorStyles: 'x'")
    #expect(calc.evaluate("4 * 3") == 12, "multipleOperatorStyles: '*'")
    #expect(calc.evaluate("4 • 3") == 12, "multipleOperatorStyles: '•'")
    #expect(calc.evaluate("10 / 2") == 5, "multipleOperatorStyles: '/'")
    #expect(calc.evaluate("10 / 2") == 5, "multipleOperatorStyles: '÷'")
    #expect(calc.evaluate("4 – 4") == 0, "multipleOperatorStyles: '–'")
}

@Test("Divide By 0")
func DivideBy0() async throws {
    #expect(calc.evaluate("10 / 0").isNaN == true)
}
