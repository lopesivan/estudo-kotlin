class App(
    var nome: String = "Anônimo",
    var versao: Int = 1
)
{
    val greeting: String
        get() = "Olá, $nome! (v$versao)"
}

fun main()
{
    val app1 = App()                       // Sem parâmetros
    val app2 = App("Lucas")                // Apenas nome
    val app3 = App("Lucas", 2)             // Nome e versão
    val app4 = App(versao = 3)             // Apenas versão (usando named arguments)

    println(app1.greeting) // Olá, Anônimo! (v1)
    println(app2.greeting) // Olá, Lucas! (v1)
    println(app3.greeting) // Olá, Lucas! (v2)
    println(app4.greeting) // Olá, Anônimo! (v3)
}
