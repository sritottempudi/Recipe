import XCTest
@testable import DataModels
@testable import NetworkService

final class MockNetworkServiceTests: XCTestCase {
    
    var mockService: MockNetworkService!
    var mockNetworkRequest = NetworkRequest(path: "/unitTesting", method: "GET", headers: nil, body: nil)
    
    override func setUp() {
        super.setUp()
        mockService = MockNetworkService()
    }
    
    override func tearDown() {
        mockService = nil
        super.tearDown()
    }
    
    /// Test a successful response with valid JSON
    func testRequest_Success() async throws {
        let jsonData = """
        {
            "id": 123,
            "name": "Test"
        }
        """.data(using: .utf8)!

        mockService.mockResult = .success(jsonData)

        let result: MockResponse = try await mockService.request(networkRequest: mockNetworkRequest)

        XCTAssertEqual(result, MockResponse(id: 123, name: "Test", description: nil))
    }

    /// Test case when `mockResult` is `nil`
    func testRequest_ThrowsUnknownError() async {
        mockService.mockResult = nil

        do {
            _ = try await mockService.request(networkRequest: mockNetworkRequest) as MockResponse
            XCTFail("Expected request failure but succeeded")
        } catch {
            XCTAssertEqual(error as? NetworkError, .unknown)
        }
    }

    /// Test case when the JSON decoding fails
    func testRequest_DecodingError() async {
        let invalidJsonData = "invalid json".data(using: .utf8)!

        mockService.mockResult = .success(invalidJsonData)

        do {
            _ = try await mockService.request(networkRequest: mockNetworkRequest) as MockResponse
            XCTFail("Expected request failure but succeeded")
        } catch {
            XCTAssertEqual(error as? NetworkError, .decodingError)
        }
    }

    ///  Test case when a custom error is thrown
    func testRequest_ThrowsCustomError() async {
        mockService.mockResult = .failure(NetworkError.requestFailed)
        do {
            _ = try await mockService.request(networkRequest: mockNetworkRequest) as MockResponse
            XCTFail("Expected request failure but succeeded")
        } catch {
            XCTAssertEqual(error as? NetworkError, .requestFailed)
        }
    }
}

