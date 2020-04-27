//
//  ViewController.swift
//  SnapshotTest
//
//  Created by dev on 22/4/2563 BE.
//  Copyright © 2563 snapshot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var superValentineTableView: UITableView!
    var superValentines: [StudentTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superValentineTableView.register(nibCellClass: StudentTableViewCell.self)
        
        superValentines.append(StudentTableViewCellViewModel(image: "jane", name: "Jane"))
        superValentines.append(StudentTableViewCellViewModel(image: "noon", name: "Noon"))
        superValentines.append(StudentTableViewCellViewModel(image: "bo", name: "Bo"))
        superValentineTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superValentines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: StudentTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let superValentine: StudentTableViewCellViewModel = superValentines[indexPath.row]
      cell.updateUI(viewModel: superValentine)
      return cell
    }
}

