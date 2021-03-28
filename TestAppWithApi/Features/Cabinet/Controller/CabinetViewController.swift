//
//  CabinetViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 16.03.2021.
//

import UIKit

enum CabinetItemType {
    case personalData
    case myOrders
    case favorites
    case about
//    case signOut
}

class CabinetItem {
    var iconIN: String?
    var title: String
    var type: CabinetItemType
    
    init(_ iconIN: String?,_ title: String,_ type: CabinetItemType) {
        self.iconIN = iconIN
        self.title = title
        self.type = type
    }
}

class CabinetViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var cabinetItems: [CabinetItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // Mark: - VM
    var viewModel = CabinetVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.emGreen
        self.navigationItem.leftBarButtonItem = .init(image: Asset.icNavEmLogo.image, style: .plain, target: self, action: #selector(goToMainPage))
        self.navigationController?.navigationBar.barTintColor = .white
        self.tableView.backgroundColor = .white
        self.view.backgroundColor = .white
        self.tableView.separatorStyle = .none
        self.setupTV()
        
        
        self.cabinetItems = [
            CabinetItem("ic_gray_user", "Личные данные", .personalData),
            CabinetItem("ic_gray_my_orders", "Мои заказы", .myOrders),
            CabinetItem("ic_gray_heart", "Избранное", .favorites),
            CabinetItem("ic_gray_about_service", "О сервисе", .about)
        ]
        
        self.viewModel.getProfile {}

    }
    
    private func setupTV() {
        self.tableView.register(CabinetTVC.nib, forCellReuseIdentifier: CabinetTVC.cellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func footerView() -> UIView {
        let view = UIView(frame: .init(x: 0, y: 0, width: self.tableView.frame.width, height: 60))
        view.backgroundColor = .orange
        return view
    }
    
    @objc func goToMainPage() {
        print("Press to Icon")
    }
    
}

extension CabinetViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cabinetItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CabinetTVC.cellID, for: indexPath) as! CabinetTVC
        cell.cabinetItem = self.cabinetItems[indexPath.row]
        return cell
    }
  
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = LogoutFooterView()
        footer.logoutTap = { [weak self] in
            self?.showLogoutAlert()
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch self.cabinetItems[indexPath.row].type {
        case .personalData:
            self.fetchUserDetail()
        case .myOrders:
            self.fetchUserDetail()
        case .favorites:
            self.fetchUserDetail()
        case .about:
            self.fetchUserDetail()
        }
    }
    
    private func fetchUserDetail() {
        guard let profile = self.viewModel.profile else {
            self.viewModel.getProfile {
                if self.viewModel.profile != nil {
                    self.pushPersonalDataVC(self.viewModel.profile!)
                    return
                }
            }
            return
        }
        self.pushPersonalDataVC(profile)
    }
    
    func pushPersonalDataVC(_ profile: Profile?) {
        let vc = PersonalDataViewController(self.viewModel, profile!, .simple)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showLogoutAlert() {
        let alert = UIAlertController(title: "Выход с аккаунта", message: "Вы действительно выйти с аккаунта", preferredStyle: .alert)
        let stayAction = UIAlertAction(title: "Остаться", style: .default, handler: nil)
        let exitAction = UIAlertAction(title: "Выйти", style: .destructive, handler: nil)
        
        alert.addAction(stayAction)
        alert.addAction(exitAction)
        self.present(alert, animated: true, completion: nil)
    }
}


