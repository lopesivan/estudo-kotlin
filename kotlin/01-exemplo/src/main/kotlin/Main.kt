class App(var nome: String) {
    val greeting: String
        get() {
            return "Hello World! Eu sou o $nome"
        }
}

fun main() {
    // Agora é obrigatório passar o nome ao instanciar
    val meuApp = App("Ivan")
    println(meuApp.greeting)
}
