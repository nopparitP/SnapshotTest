//
//  SnapshotTestTests.swift
//  SnapshotTestTests
//
//  Created by dev on 22/4/2563 BE.
//  Copyright © 2563 snapshot. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import SnapshotTest

final class SnapshotTestTests: FBSnapshotTestCase {

    var cell: StudentTableViewCell!
    
    override func setUp() {
        super.setUp()
        setupUI()
        //self.recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
        cell = nil
    }
    
    func setupUI() {
      cell = StudentTableViewCell.loadNib()
    }
    
    func testStudentTableViewCellRenderWithText() {
        cell.frame = CGRect(x: 0, y: 0, width: 417, height: 108)
        cell.updateUI(viewModel: StudentTableViewCellViewModel(image: "bo", name: "Bo"))
        FBSnapshotVerifyView(cell)
    }
    
    func testStudentTableViewCellRenderWithLongText() {
        cell.frame = CGRect(x: 0, y: 0, width: 417, height: 108)
        cell.updateUI(viewModel: StudentTableViewCellViewModel(image: "bo", name: "Jane Noon Bo Jane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon BoJane Noon Bo"))
        FBSnapshotVerifyView(cell)
    }
}
