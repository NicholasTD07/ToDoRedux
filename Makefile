SCHEME=ToDoRedux
TARGET=ToDoRedux

default: test

test:
	swift test

build-for-coverage:
	swift package generate-xcodeproj
	xcodebuild -scheme $(SCHEME) -enableCodeCoverage YES test &>/dev/null

coverage: build-for-coverage
	./utils/codecov -J '$(TARGET)' -d -c | ./utils/codecov-filter

raw-coverage:
	./utils/codecov -J '$(TARGET)' -d -c

clean:
	swift build --clean

clean-for-coverage:
	xcodebuild -scheme $(SCHEME) clean &>/dev/null
