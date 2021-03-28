//
//  LogoutFooterView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 18.03.2021.
//

import UIKit

class LogoutFooterView: UIView {
    
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var appVersionLbl: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    public var logoutTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LogoutFooterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.setupOutlets()
    }
    
    private func setupOutlets() {
        self.titleBtn.setTitle("Выйти с аккаунта", for: .normal)
        self.titleBtn.setTitleColor(UIColor(red: 1, green: 0.106, blue: 0.106, alpha: 1), for: .normal)
        self.appVersionLbl.text = "v\(Bundle.main.versionNumber)"
    }
    
    @IBAction func logoutTaped(_ sender: UIButton) {
        logoutTap?()
    }
}
