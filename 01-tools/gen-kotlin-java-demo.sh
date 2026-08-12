#!/usr/bin/env bash

set -e

PROJECT="kotlin-java-demo"

mkdir -p "$PROJECT/src/main/kotlin"
mkdir -p "$PROJECT/src/main/java"

cat > "$PROJECT/src/main/kotlin/Calculadora.kt" <<'EOF'
class Calculadora {

    fun somar(a: Int, b: Int): Int {
        return a + b
    }
}
EOF

cat > "$PROJECT/src/main/java/Main.java" <<'EOF'
public class Main {

    public static void main(String[] args) {
        Calculadora calc = new Calculadora();

        int resultado = calc.somar(2, 2);

        System.out.println("Resultado: " + resultado);
    }
}
EOF

cat > "$PROJECT/Makefile" <<'EOF'
KOTLIN_SRC := src/main/kotlin
JAVA_SRC := src/main/java

BUILD_DIR := build
KOTLIN_BUILD := $(BUILD_DIR)/kotlin
JAVA_BUILD := $(BUILD_DIR)/java

KOTLINC := kotlinc
JAVAC := javac
KOTLIN := kotlin

KOTLIN_FILES := $(shell find $(KOTLIN_SRC) -name '*.kt')
JAVA_FILES := $(shell find $(JAVA_SRC) -name '*.java')

.PHONY: all build kotlin java run clean

all: build

build: kotlin java

kotlin:
	mkdir -p $(KOTLIN_BUILD)
	$(KOTLINC) \
		$(KOTLIN_FILES) \
		-d $(KOTLIN_BUILD)

java: kotlin
	mkdir -p $(JAVA_BUILD)
	$(JAVAC) \
		-classpath $(KOTLIN_BUILD) \
		-d $(JAVA_BUILD) \
		$(JAVA_FILES)

run: build
	$(KOTLIN) \
		-classpath "$(KOTLIN_BUILD):$(JAVA_BUILD)" \
		Main

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
echo "Entre no projeto:"
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
