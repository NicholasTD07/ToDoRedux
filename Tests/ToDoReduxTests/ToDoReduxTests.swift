import XCTest
import ToDoRedux

/// This class is used to setup the store only.
/// No tests should be written here
/// since it's inherited by other Test classes.
class ToDoReduxTests: XCTestCase {
    var store: ToDoRedux.Store!

    override func setUp() {
        super.setUp()

        store = Store.init(with: ToDoRedux.reducer)
    }
}

class StateTests: ToDoReduxTests {
    func testInitialState() {
        XCTAssertTrue(store.state.tags.isEmpty)
        XCTAssertTrue(store.state.todos.all.isEmpty)
    }
}

class TagsTests: ToDoReduxTests {
    func testAddTag() {
        store.dispatch(TagActions.add(name: "Home"))

        XCTAssertEqual(store.state.tags.count, 1)

        let tag = store.state.tags.first!

        XCTAssertEqual(tag.name, "Home")
    }
}
