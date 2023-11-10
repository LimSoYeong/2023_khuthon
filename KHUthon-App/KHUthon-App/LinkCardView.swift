//
//  LinkCardView.swift
//  KHUthon-App
//
//  Created by 민 on 11/11/23.
//

import UIKit
import SnapKit
import Then

class LinkCardView: UIView {
    
    // MARK: - Properties
    var indexNumber: Int = 0
    
    // MARK: - UI Components
    private let linkImageButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(tabToLinkView), for: .touchUpInside)
    }
    private let shadowView = UIView().then {
        $0.layer.cornerRadius = 10
    }
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.numberOfLines = 3
    }
    private let blogLabel = UILabel().then {
        $0.textColor = .white
        $0.numberOfLines = 2
    }

    // MARK: - View Life Cycle
    init(imageName: String, alpha: Float, title: String, blog: String, index: Int) {
        super.init(frame: CGRect())
        
        linkImageButton.setImage(UIImage(named: imageName), for: .normal)
        shadowView.backgroundColor = .black.withAlphaComponent(CGFloat(alpha))
        titleLabel.text = title
        blogLabel.text = blog
        indexNumber = index
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func tabToLinkView(_ sender: UIButton) {
        print("click!")
    }
}

extension LinkCardView {
    // UI 세팅
    private func setupUI() {
        self.addSubViews(linkImageButton)
        linkImageButton.addSubViews(shadowView)
        shadowView.addSubViews(titleLabel, blogLabel)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.size.equalTo(120)
        }
        linkImageButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        blogLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
