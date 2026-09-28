JAVA_SRC   := src/main/java
KOTLIN_SRC := src/main/kotlin

BUILD_DIR  := build
JAVA_BUILD := $(BUILD_DIR)/java
APP_JAR    := $(BUILD_DIR)/app.jar

JAVAC   := javac
KOTLINC := kotlinc
JAVA    := java

KOTLIN_FILES := $(shell find $(KOTLIN_SRC) -name '*.kt')

.PHONY: all build kotlin run clean

all: build

build: kotlin

kotlin:
	mkdir -p $(BUILD_DIR)
	$(KOTLINC) \
		$(KOTLIN_FILES) \
		-include-runtime \
		-d $(APP_JAR)

run:
	$(JAVA) \
		-cp "$(APP_JAR)" \
		MainKt

clean:
	rm -rf $(BUILD_DIR)
