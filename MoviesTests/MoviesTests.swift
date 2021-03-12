//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Kleyson on 03/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut = vc
        sut.loadView()
    }
    
    func testTitleViewController() {
    sut.viewDidLoad()
        XCTAssertEqual(sut.title, "Filmes")
    }
}
