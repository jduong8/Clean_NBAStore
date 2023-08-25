//
//  ViewModelCartTests.swift
//  Clean_NBAStoreTests
//
//  Created by Jonathan Duong on 25/08/2023.
//

@testable import Clean_NBAStore
import XCTest

class ViewModelCartTests: XCTestCase {

    var mockCartRepository: MockCartRepository!
    var viewModel: ViewModelCart!

    override func setUp() {
        super.setUp()
        mockCartRepository = MockCartRepositoryDefault()
        viewModel = ViewModelCart(mockCartRepository: mockCartRepository)
    }

    override func tearDown() {
        mockCartRepository = nil
        viewModel = nil
        super.tearDown()
    }

    func testAddToCart() {
        let initialPurchase = Purchase(quantity: 1, product: Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)
        viewModel.addToCart(for: initialPurchase)

        let cartItems = viewModel.purchases
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 1)
        XCTAssertEqual(cartItems.first?.quantity, 2)  // Car dans MockCartRepositoryDefault.addToCart, on ajoute +1 à la quantité
    }

    func testRemoveFromCart() {
        let initialPurchase = Purchase(quantity: 1, product: Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)
        
        let cartItems = viewModel.purchases
        viewModel.removeFromCart(for: initialPurchase)
        
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 1)
        XCTAssertEqual(cartItems[0].quantity, 1)
    }

    func testRemoveFromCartWhenQuantityIsZero() {
        let initialPurchase = Purchase(quantity: 1, product: Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)

        viewModel.removeFromCart(for: initialPurchase)
        let cartItems = viewModel.purchases
        print(cartItems.count)
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 0)
    }
}
