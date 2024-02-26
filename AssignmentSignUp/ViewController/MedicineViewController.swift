//
//  MedicineViewController.swift
//  AssignmentSignUp
//
//  Created by Jaehui Yu on 2/26/24.
//

import UIKit
import SnapKit

class MedicineViewController: UIViewController {
    
    let tableView = UITableView()
    
    let viewModel = MedicineViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel.inputViewDidLoadTrigger.value = ()
        bindData()

        configureHierarchy()
        configureView()
        configureConstraints()
        
    }
    
    func bindData() {
        viewModel.outputMedicineItems.bind { value in
            self.tableView.reloadData()
        }
    }
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "medicineCell")
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MedicineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputMedicineItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineCell")!
        cell.textLabel?.text = viewModel.outputMedicineItems.value[indexPath.row].itemName
        return cell
    }
}
