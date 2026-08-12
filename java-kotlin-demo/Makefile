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
