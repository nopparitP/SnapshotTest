//
//  StudentTableViewCell.swift
//  SnapshotTest
//
//  Created by dev on 22/4/2563 BE.
//  Copyright © 2563 snapshot. All rights reserved.
//

import UIKit

public struct StudentTableViewCellViewModel {
    let image: String
    let name: String
}

final class StudentTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var avartarImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    
    func updateUI(viewModel: StudentTableViewCellViewModel) {
        avartarImageView.image = UIImage(named: viewModel.image)
        actorNameLabel.text = viewModel.name
    }
}
