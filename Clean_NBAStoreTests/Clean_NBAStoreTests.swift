//
//  Clean_NBAStoreTests.swift
//  Clean_NBAStoreTests
//
//  Created by Jonathan Duong on 23/08/2023.
//

@testable import Clean_NBAStore
import XCTest

final class Clean_NBAStoreTests: XCTestCase {

    var mockRepo: MockProductRepositoryDefault!
    var viewModel: ViewModelProductListTests!

    override func setUpWithError() throws {
        mockRepo = MockProductRepositoryDefault()
        viewModel = ViewModelProductListTests(mockProductRepository: mockRepo)
    }

    override func tearDownWithError() throws {
        mockRepo = nil
        viewModel = nil
    }

    func testViewModelProductsReturnsExpectedValue() throws {
        let mockProduct1 = Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: "")
        let mockProduct2 = Product(id: 1, type: .short, name: "Some Short", shortDescription: "", description: "", price: 19.99, imageName: "")
        mockRepo.mockProducts = [mockProduct1, mockProduct2]
        
        let result = viewModel.products

        XCTAssertEqual(result, [mockProduct1, mockProduct2])
    }
    
    func testViewModelProductsReturnsEmptyArrayWhenNoProductsAvailable() throws {
        mockRepo.errorToThrow = .noProductsAvailable

        let result = viewModel.products

        XCTAssertTrue(result.isEmpty)
    }

    func testViewModelProductsReturnsEmptyArrayWhenError() throws {
        mockRepo.errorToThrow = .networkError

        let result = viewModel.products

        XCTAssertTrue(result.isEmpty)
    }
}
