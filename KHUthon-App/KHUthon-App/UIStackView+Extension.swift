//
//  UIStackView+Extension.swift
//  KHUthon-App
//
//  Created by 민 on 11/11/23.
//

import UIKit

extension UIStackView {
    // StackView에서 여러개의 addArrangedSubview 추가하기
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
