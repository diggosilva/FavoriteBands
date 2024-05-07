//
//  DetailsBandViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsBandViewController: UIViewController {
    
    let detailsBandView = DetailsBandView()
    
    override func loadView() {
        super.loadView()
        view = detailsBandView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegateAndDataSource()
    }
    
    private func setNavBar() {
        title = "DETALHES"
        view.backgroundColor = .systemBackground
    }
    
    private func setDelegateAndDataSource() {
        detailsBandView.tableView.delegate = self
        detailsBandView.tableView.dataSource = self
    }
    
}

extension DetailsBandViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsMemberCell.identifier, for: indexPath) as? DetailsMemberCell else { return UITableViewCell() }
//        cell.textLabel?.text = "TESTE"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
