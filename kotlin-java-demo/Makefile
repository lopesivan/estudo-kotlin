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
