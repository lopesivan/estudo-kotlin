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
    val x = Math.PI
    val terms = 6

    val cf = continuedFraction(x, terms)

    println("Número: $x")
    println("Fração contínua: [${cf.first()};${cf.drop(1).joinToString(",")}]")
    // mostra o primeiro e vai de um em um e separa por virgula, é isso ?
    //
    // Sim, é isso. Mas há um detalhe importante: drop(1) não vai de um em um.
    // Ele cria uma lista nova ignorando o primeiro elemento. Depois
    // joinToString(",") percorre os restantes e coloca vírgulas entre eles.
    //
}
