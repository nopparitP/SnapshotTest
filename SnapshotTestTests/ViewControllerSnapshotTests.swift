//
//  ViewControllerSnapshotTests.swift
//  SnapshotTestTests
//
//  Created by dev on 27/4/2563 BE.
//  Copyright © 2563 snapshot. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import SnapshotTest

final class ViewControllerSnapshotTests: FBSnapshotTestCase {

    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        setupUI()
        //self.recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
    }
    
    func setupUI() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewController") as? ViewController
        viewController = vc
    }
    
    func testViewControllerWithTable() {
        FBSnapshotVerifyView(viewController.view)
    }
}
