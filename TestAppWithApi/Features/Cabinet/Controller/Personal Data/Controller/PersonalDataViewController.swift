//
//  PersonalDataViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 19.03.2021.
//

import UIKit

class PersonalDataViewController: UIViewController {

    enum CabinetShowType {
        case edit
        case simple
    }
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var birthDayTF: UITextField!
    
    var profile: Profile
    var viewModel: CabinetVM
    var cabinetType: CabinetShowType
    
    init(_ viewModel: CabinetVM,_ profile: Profile,_ cabinetType: CabinetShowType) {
        self.viewModel = viewModel
        self.profile = profile
        self.cabinetType = cabinetType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
