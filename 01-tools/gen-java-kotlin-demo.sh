#!/usr/bin/env bash

set -e

PROJECT="java-kotlin-demo"

mkdir -p "$PROJECT/src/main/java"
mkdir -p "$PROJECT/src/main/kotlin"

cat > "$PROJECT/src/main/java/Calculadora.java" <<'EOF'
public class Calculadora {

    public int somar(int a, int b) {
        return a + b;
    }
}
EOF

cat > "$PROJECT/src/main/kotlin/Main.kt" <<'EOF'
fun main() {
    val calc = Calculadora()

    val resultado = calc.somar(2, 2)

    println("Resultado: $resultado")
}
EOF

cat > "$PROJECT/Makefile" <<'EOF'
JAVA_SRC := src/main/java
KOTLIN_SRC := src/main/kotlin

BUILD_DIR := build
JAVA_BUILD := $(BUILD_DIR)/java
APP_JAR := $(BUILD_DIR)/app.jar

JAVAC := javac
KOTLINC := kotlinc
JAVA := java

JAVA_FILES := $(shell find $(JAVA_SRC) -name '*.java')
KOTLIN_FILES := $(shell find $(KOTLIN_SRC) -name '*.kt')

.PHONY: all build java kotlin run clean

all: build

build: java kotlin

java:
	mkdir -p $(JAVA_BUILD)
	$(JAVAC) \
		-d $(JAVA_BUILD) \
		$(JAVA_FILES)

kotlin: java
	mkdir -p $(BUILD_DIR)
	$(KOTLINC) \
		$(KOTLIN_FILES) \
		-classpath $(JAVA_BUILD) \
		-include-runtime \
		-d $(APP_JAR)

run: build
	$(JAVA) \
		-cp "$(APP_JAR):$(JAVA_BUILD)" \
		MainKt

clean:
	rm -rf $(BUILD_DIR)
EOF

cat > "$PROJECT/.gitignore" <<'EOF'
build/
*.class
*.jar
EOF

echo
echo "Projeto criado em: $PROJECT"
echo
echo "Entre no diretório:"
echo "  cd $PROJECT"
echo
echo "Compile:"
echo "  make"
echo
echo "Execute:"
echo "  make run"
echo
echo "Limpe:"
echo "  make clean"

