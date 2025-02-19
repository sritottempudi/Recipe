import XCTest
@testable import DataModels

final class DataModelsTests: XCTestCase {
    
    var mockDataModel = MockRecipeModelTests()
    
    func testRecipeResponse_DecodesSuccessfully() throws {
        // When: Decoding a valid JSON response
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipeResponse.self,
                                          from: mockDataModel.validJSON)
        
        // Then: Ensure it decodes correctly
        XCTAssertEqual(response.recipes.count, 1)
        
        let recipe = response.recipes.first!
        XCTAssertEqual(recipe.cuisine, "Malaysian")
        XCTAssertEqual(recipe.name, "Apam Balik")
        XCTAssertEqual(recipe.photoURLLarge, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")
        XCTAssertEqual(recipe.photoURLSmall, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
        XCTAssertEqual(recipe.sourceURL, "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")
        XCTAssertEqual(recipe.uuid, "0c6ca6e7-e32a-4053-b824-1dbf749910d8")
        XCTAssertEqual(recipe.youtubeURL, "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    }
    
    func testRecipeResponse_DecodesWithoutOptionalFields() throws {
        // When: Decoding a JSON missing optional fields
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipeResponse.self,
                                          from: mockDataModel.jsonWithoutOptionalFields)
        
        // Then: Ensure it decodes correctly
        XCTAssertEqual(response.recipes.count, 1)
        
        let recipe = response.recipes.first!
        XCTAssertEqual(recipe.cuisine, "American")
        XCTAssertEqual(recipe.name, "Hot Chocolate Fudge")
        XCTAssertEqual(recipe.photoURLLarge, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/6d8e878b-0ca8-4173-94b7-60a006b676d6/large.jpg")
        XCTAssertEqual(recipe.photoURLSmall, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/6d8e878b-0ca8-4173-94b7-60a006b676d6/small.jpg")
        XCTAssertEqual(recipe.uuid, "a43f53ea-4d06-46c1-bd20-5d8e487ea52b")
        
        // Optional fields should be nil
        XCTAssertNil(recipe.sourceURL)
        XCTAssertNil(recipe.youtubeURL)
    }

    func testRecipeResponse_DecodingFails_WithWrongKeys() {
        let decoder = JSONDecoder()
        
        // When/Then: Expect decoding failure due to incorrect JSON keys
        XCTAssertThrowsError(try decoder.decode(RecipeResponse.self, from: mockDataModel.invalidJSON)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

}
