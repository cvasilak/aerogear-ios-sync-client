import UIKit
import XCTest
import AeroGearSyncClient
import AeroGearSync

class SyncClientTests: XCTestCase {

    typealias T = JsonConverter.Json
    typealias E = JsonPatchEdit

    var dataStore: InMemoryDataStore<T, E>!
    var synchonizer: JsonPatchSynchronizer!
    var engine: ClientSyncEngine<JsonPatchSynchronizer, InMemoryDataStore<T, E>>!

    class StringContentSerializer : ContentSerializer {
        func asString(content: String) -> String {
            return content
        }
    }
    class JsonContentSerializer : ContentSerializer {
        func asString(content: T) -> String {
            return JsonConverter.asJsonString(content)!
        }
    }
    let stringContentSerializer = StringContentSerializer()
    let jsonContentSerializer = JsonContentSerializer()

    override func setUp() {
        super.setUp()
        self.dataStore = InMemoryDataStore()
        self.synchonizer = JsonPatchSynchronizer()
        self.engine = ClientSyncEngine(synchronizer: synchonizer, dataStore: dataStore)
    }
    // TODO AGIOS-344 move integration test separate target
/*
    func testAddDocument() {
        let syncClient = SyncClient(url: "http://localhost:7777/sync", syncEngine: engine, contentSerializer: jsonContentSerializer)
        let id = NSUUID().UUIDString
        let content = ["name": "Fletch"]
        let callback = {(doc: ClientDocument<T>) -> () in }
        syncClient.connect().addDocument(ClientDocument<T>(id: id, clientId: "iosClient", content: content), callback)
        sleep(3)
        let added = dataStore.getClientDocument(id, clientId: "iosClient")
        XCTAssertEqual(id, added!.id)
        XCTAssertEqual("iosClient", added!.clientId)
        XCTAssertEqual(content["name"]! as String, added!.content["name"] as String)
        syncClient.disconnect()
    }
    
    func testDiffAndSync() {
        let expectation = expectationWithDescription("Callback should be invoked. Is the Sync Server running?")
        let id = NSUUID().UUIDString

        let content = ["name": "Fletch"]
        let update = ["name": "Fletch2"]
        let syncClient = SyncClient(url: "http://localhost:7777/sync", syncEngine: engine, contentSerializer: jsonContentSerializer)
        let callback = {(doc: ClientDocument<T>) -> () in
            println("Testing callback: received: \(doc.content)")
            XCTAssertEqual(doc.content["name"]! as String, "Fletch2")
            expectation.fulfill()
        }
        syncClient.connect().addDocument(ClientDocument<T>(id: id, clientId: "iosClient", content: content), callback)
        syncClient.diffAndSend(ClientDocument<T>(id: id, clientId: "iosClient", content: update))
        waitForExpectationsWithTimeout(3.0, handler:nil)
        syncClient.disconnect()
    }
*/
}
