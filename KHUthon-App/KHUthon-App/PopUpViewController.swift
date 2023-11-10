//
//  PopUpViewController.swift
//  KHUthon-App
//
//  Created by 민 on 11/10/23.
//

import UIKit
import SnapKit
import Then

struct urlDataModel: Encodable {
    var url: String
}

class PopUpViewController: UIViewController {
    
    var inputURL = urlDataModel(url: "")

    // MARK: - Properties
    private let backgroundImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "backgroundImg")
    }
    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let popUpTitleLabel = UILabel().then {
        $0.text = "새로운 링크 추가"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18.0, weight: .bold)
        $0.textColor = .black
    }
    
    private let dismissButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .systemGray
        $0.addTarget(self, action: #selector(dismissToMain), for: .touchUpInside)
    }
    
    private let linkInputTextField = UITextField().then {
        $0.placeholder = "   링크를 입력해주세요!"
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemGray6
    }
    
    private let checkImage = UIImageView().then {
        $0.image = UIImage(systemName: "checkmark")
        $0.tintColor = .systemGray3
    }
    
    private let descriptioonTextFieldLabel = UITextField().then {
        $0.text = "링크는 https:// 부터 시작하는 형태의 텍스트여야 합니다!"
        $0.textColor = .systemGray3
    }
    
    private let addLinkButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("해당 링크 추가하기", for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(addToNewLink), for: .touchUpInside)
    }
    
    private lazy var activityIndicator = UIActivityIndicatorView().then {
        $0.color = .gray
        $0.style = .medium
        $0.hidesWhenStopped = true
        $0.stopAnimating()
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Action Properties
    @objc private func dismissToMain(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @objc private func addToNewLink(_ sender: UIButton) {
        activityIndicator.startAnimating()
        self.inputURL = urlDataModel(url: linkInputTextField.text ?? "")
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try jsonEncoder.encode(inputURL)
        } catch {
            print("error")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let popupVC = NextViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            self.present(popupVC, animated: false)
        }
    }
    
}

// MARK: - Extensions
extension PopUpViewController {
    // UI 세팅
    private func setupUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.5)
        self.view.addSubViews(containerView, activityIndicator)
        containerView.addSubViews(popUpTitleLabel,
                                  dismissButton,
                                  linkInputTextField,
                                  checkImage,
                                  descriptioonTextFieldLabel,
                                  addLinkButton)
        
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        activityIndicator.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.center.equalToSuperview()
        }

        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(580)
            make.height.equalTo(285)
        }
        popUpTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(38)
        }
        dismissButton.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.top.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(28)
        }
        linkInputTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(43)
            make.width.equalTo(500)
            make.top.equalTo(popUpTitleLabel.snp.bottom).offset(24)
        }
        checkImage.snp.makeConstraints { make in
            make.top.equalTo(linkInputTextField.snp.bottom).offset(14)
            make.size.equalTo(16)
            make.leading.equalTo(linkInputTextField.snp.leading)
        }
        descriptioonTextFieldLabel.snp.makeConstraints { make in
            make.top.equalTo(linkInputTextField.snp.bottom).offset(14)
            make.leading.equalTo(checkImage.snp.trailing).offset(5)
        }
        addLinkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(33)
            make.width.equalTo(277)
            make.height.equalTo(54)
        }
    }
    
}

