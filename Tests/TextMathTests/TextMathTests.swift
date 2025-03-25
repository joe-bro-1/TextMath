import Testing
@testable import TextMath

extension Tag {
    @Tag static var singleOperationEquations: Tag
}

let IntCalc = Calculator<Int>()

@Test("addition", .tags(.singleOperationEquations))
func addition() async throws {
    #expect(IntCalc.evaluate("3 + 3") == 6)
}

@Test("subtraction", .tags(.singleOperationEquations))
func subtraction() async throws {
    #expect(IntCalc.evaluate("6 - 7") == 1)
}

@Test("multiplication", .tags(.singleOperationEquations))
func multiplication() async throws {
    #expect(IntCalc.evaluate("4 * 3") == 12)
}

@Test("division", .tags(.singleOperationEquations))
func division() async throws {
    #expect(IntCalc.evaluate("4 / 3") == 12)
}

@Test("multiple operator styles")
func multipleOperatorStyles() async throws {
    #expect(IntCalc.evaluate("4 X 3") == 12, "multipleOperatorStyles: 'X'")
    #expect(IntCalc.evaluate("4 x 3") == 12, "multipleOperatorStyles: 'x'")
    #expect(IntCalc.evaluate("4 * 3") == 12, "multipleOperatorStyles: '*'")
    #expect(IntCalc.evaluate("4 • 3") == 12, "multipleOperatorStyles: '•'")
    #expect(IntCalc.evaluate("10 / 2") == 5, "multipleOperatorStyles: '/'")
    #expect(IntCalc.evaluate("10 / 2") == 5, "multipleOperatorStyles: '÷'")
    #expect(IntCalc.evaluate("4 – 4") == 0, "multipleOperatorStyles: '÷'")
}
