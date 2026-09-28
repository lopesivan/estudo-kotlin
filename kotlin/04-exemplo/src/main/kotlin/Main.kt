import kotlin.math.floor

fun continuedFraction(x: Double, terms: Int): List<Long> {
    require(terms > 0)

    val coefficients = mutableListOf<Long>()
    var value = x

    repeat(terms) {
        val integerPart = floor(value).toLong()
        coefficients.add(integerPart)

        val fractionalPart = value - integerPart

        // Se não existe mais parte fracionária, o número é racional
        // dentro da precisão disponível.
        if (fractionalPart == 0.0) {
            return coefficients
        }

        value = 1.0 / fractionalPart
    }

    return coefficients
}

fun main() {
    var x = Math.PI
    val terms = 6

    var cf = continuedFraction(x, terms)

    println("Número: $x")
    println("Fração contínua: [${cf.first()};${cf.drop(1).joinToString(",")}]")

    x = Math.E

    cf = continuedFraction(x, terms)

    println("Número: $x")
    println("Fração contínua: [${cf.first()};${cf.drop(1).joinToString(",")}]")
}
