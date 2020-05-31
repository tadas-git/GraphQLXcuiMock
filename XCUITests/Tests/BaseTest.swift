//
//  BaseTest.swift
//  TopQuestionUITests
//
//  Created by Tadas Stankevicius on 30/05/2020.
//

import Swifter
import XCTest

class BaseTest: XCTestCase {
    
    let server = HttpServer()

    var requests = [String: [String]]()

    lazy var app: XCUIApplication = {
        return XCUIApplication()
    }()
    
    override func setUp() {
        super.setUp()
        
        configureMockServer()
        startMockServer(port: 8080)

        continueAfterFailure = false
        app.launchArguments = ["UITEST"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
}

extension BaseTest {
    
    func configureMockServer() {
        var savedOperations = [String]()

        requests.forEach { pairInfo in
            let path = pairInfo.key
            let response = pairInfo.value[0]
            let json = getParsedJsonFromFile(fileName: response)

            if path.contains("graphql") {
                savedOperations.append(response)
                server["graphql"] = { request_ in
                    let requestOperation = request_.headers["x-apollo-operation-name"]!
                    var gqlJson = self.getParsedJsonFromFile(fileName: response)

                    savedOperations.forEach { operation in
                        if operation == requestOperation {
                            gqlJson = self.getParsedJsonFromFile(fileName: operation)
                        }
                    }
                    return HttpResponse.ok(.json(gqlJson))
                }
            } else {
                server[path] = { request_ in HttpResponse.ok(.json(json))}
            }
        }
    }
    
    func startMockServer(port: UInt16) {
        do {
            try server.start(port, forceIPv4: true)
            print("server started")
        } catch {
            print("error starting server")
        }
    }
    
    func getParsedJsonFromFile(fileName: String) -> Any {
        var json: Any?

        let testBundle = Bundle(for: type(of: self))
        let url = testBundle.path(forResource: fileName, ofType: "json")

        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: url!))
            json = try JSONSerialization.jsonObject(with: jsonData)
        } catch {
            print(error)
        }
        return json!
    }
}


