//
//  InstitutionHeaderTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 10.04.2021.
//

import UIKit
import TTGTagCollectionView

protocol InstitutionTVHeaderDelegate {
    func didTappedOnTag(_ tag: String)
    func didTappedOnSearch()
}


class InstitutionHeaderTVCell: UITableViewCell, UITextFieldDelegate, TTGTextTagCollectionViewDelegate {

    static let reuseIdentifier = "institutionHeaderTVCell"
    
    
    
    // Mark: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var placeholderIV: UIImageView!
    
    let deliveryLbl: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let tagListView: TTGTextTagCollectionView = {
        let view = TTGTextTagCollectionView()
        view.alignment = .center
        view.scrollDirection = .vertical
        view.verticalSpacing = 8
        view.horizontalSpacing = 8
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    var delegate: InstitutionTVHeaderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
        
    }
    
    private func setupUI() {
        self.setupViewStyle()
        self.setupTitle()
        self.setupTF()
        self.setupBorderView()
    }
    
    
    private func setupTitle() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.03
        let attributedText = NSMutableAttributedString(string: "Что будем ", attributes: [.foregroundColor: UIColor.emGreen, .font: FontFamily.OpenSans.extraBold.font(size: 24)])
        attributedText.append(.init(string: "есть?", attributes: [.foregroundColor: UIColor.emGreen, .font: FontFamily.OpenSans.extraBold.font(size: 24), .paragraphStyle: paragraphStyle]))
        self.titleLabel.attributedText = attributedText
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchOnSearchTF))
        self.titleLabel.addGestureRecognizer(tap)
    }
    
    private func setupTF() {
        self.searchTF.leftViewMode = .always
        self.searchTF.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.searchTF.layer.cornerRadius = 8
        self.searchTF.layer.borderWidth = 1
        self.searchTF.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        self.searchTF.textColor = UIColor.black
        self.searchTF.font = FontFamily.OpenSans.regular.font(size: 14)
        self.searchTF.delegate = self
        self.searchTF.isUserInteractionEnabled = true
    }
    
    private func setupViewStyle() {
        self.separatorInset = .init(top: 0, left: 1000, bottom: 0, right: 0)
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
 
    private func setupBorderView() {
        self.contentView.addSubview(self.borderView)
        self.borderView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().offset(-16)
            maker.top.equalTo(self.searchTF.snp.bottom).offset(16)
            maker.bottom.equalToSuperview().offset(-64)
        }
        self.setupTagListView()
        self.setupDeliveryLbl()
    }
    
    private func setupTagListView() {
        self.setTagListConfig()
        self.borderView.addSubview(self.tagListView)
        self.tagListView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.searchTF.snp.bottom).offset(16)
            maker.left.equalToSuperview().offset(8)
            maker.right.equalToSuperview().offset(-8)
            maker.bottom.equalToSuperview()
        }
    }
    
    private func setTagListConfig() {
        let config = TTGTextTagConfig()
        config.textColor = UIColor(red: 0.526, green: 0.604, blue: 0.491, alpha: 1)
        config.textFont = FontFamily.OpenSans.regular.font(size: 13)
        config.backgroundColor = UIColor.white
        config.borderWidth = 1
        config.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        config.exactHeight = 39
        config.cornerRadius = 6
        
        config.selectedTextColor = UIColor.white
        config.selectedBackgroundColor = UIColor.emGreen
        config.selectedBorderWidth = 0
        config.selectedCornerRadius = 6
        
        self.tagListView.delegate = self
        self.tagListView.defaultConfig = config
    }
    
    private func setupDeliveryLbl() {
        self.borderView.addSubview(self.deliveryLbl)
        self.deliveryLbl.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.tagListView.snp.bottom).offset(4)
            maker.left.equalToSuperview().offset(12)
            maker.bottom.equalToSuperview().offset(-12)
            maker.right.equalToSuperview().offset(-8)
        }
    }
    
}
