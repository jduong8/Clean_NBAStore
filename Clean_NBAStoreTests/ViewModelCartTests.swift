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
        let secondPurchase = Purchase(quantity: 5, product: Product(id: 3, type: .short, name: "Some Short", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)
        viewModel.addToCart(for: initialPurchase)
        viewModel.addToCart(for: secondPurchase)

        let cartItems = viewModel.cart
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 2)
        XCTAssertEqual(cartItems[0].product,  Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""))
        XCTAssertEqual(cartItems.first?.quantity, 2) // Car j'ajoute 2 fois le même produit dans le panier
    }

    func testRemoveFromCart() {
        let initialPurchase = Purchase(quantity: 1, product: Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)
        
        let cartItems = viewModel.cart
        viewModel.removeFromCart(for: initialPurchase)
        
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 1)
        XCTAssertEqual(cartItems.first?.quantity, 1)
    }

    func testRemoveFromCartWhenQuantityIsZero() {
        let initialPurchase = Purchase(quantity: 1, product: Product(id: 0, type: .hat, name: "Some Hat", shortDescription: "", description: "", price: 0, imageName: ""), size: .m)
        viewModel.addToCart(for: initialPurchase)

        viewModel.removeFromCart(for: initialPurchase)
        let cartItems = viewModel.cart
        XCTAssertNotNil(cartItems)
        XCTAssertEqual(cartItems.count, 0)
    }
}
