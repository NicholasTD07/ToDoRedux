SCHEME=ToDoRedux
TARGET=ToDoRedux

default: test

test:
	swift test

coverage:
	swift package generate-xcodeproj
	xcodebuild -scheme $(SCHEME) -enableCodeCoverage YES test 2>&1 >/dev/null
	./utils/codecov -J '$(TARGET)' -d

clean:
	swift build --clean
