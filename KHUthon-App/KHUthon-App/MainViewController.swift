//
//  MainViewController.swift
//  KHUthon-App
//
//  Created by 민 on 11/10/23.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let backgroundImg = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "backgroundImg")
        $0.contentMode = .scaleAspectFit
    }
    
    private let presentPopUPButton = UIButton().then {
        $0.setTitle("새로운 링크 추가하기", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(presentToPopUp), for: .touchUpInside)
    }
    
    private let firstBlogView = LinkCardView(imageName: "img1", alpha: 0.3, title: "Hadoop Yarn 아키텍쳐", blog: "일어나 코딩해야지", index: 0)
    private let secondBlogView = LinkCardView(imageName: "img2", alpha: 0.3, title: "하둡 프로그래밍 - MapReduce", blog: "개천에서 용나기", index: 0)
    private let thirdBlogView = LinkCardView(imageName: "img3", alpha: 0.3, title: "OpenSearch에 대해 알아보자!", blog: "sosimina.log", index: 0)
    private let fourthBlogView = LinkCardView(imageName: "img4", alpha: 0.3, title: "Airflow", blog: "'-", index: 0)
    private let fifthBlogView = LinkCardView(imageName: "img5", alpha: 0.3, title: "HBase", blog: "thinkp92.log", index: 0)
    private let sixthBlogView = LinkCardView(imageName: "img6", alpha: 0.3, title: "[데이터 처리] Hive", blog: "우물 밖 개구리", index: 0)
    private let seventhBlogView = LinkCardView(imageName: "img7", alpha: 0.3, title: "컴퓨터망 18) FTP TFTP", blog: "zh025700.log", index: 0)
    private let eighthBlogView = LinkCardView(imageName: "img8", alpha: 0.3, title: "SP - 8.1 Virtual Memory Concepts", blog: "Hyeoks", index: 0)
    private let ninethBlogView = LinkCardView(imageName: "img9", alpha: 0.3, title: "Deadlocks", blog: "Ddukddaki.log", index: 0)
    private let tenthBlogView = LinkCardView(imageName: "img10", alpha: 0.3, title: "[Algorithm] 깊이우선탐색(DFS)과 너비우선탐색(BFS)", blog: "Song's DLog", index: 0)
    private let eleventhBlogView = LinkCardView(imageName: "img11", alpha: 0.3, title: "[알고리즘] 다익스트라(Dijkstra) 알고리즘", blog: "LUMOS MAXIMA", index: 0)
    private let twelvthBlogView = LinkCardView(imageName: "img12", alpha: 0.3, title: "[알고리즘] 그리디, 탐욕 알고리즘 (Greedy Algorithm)", blog: "IN THE SOOP", index: 0)
    private let thirteenthBlogView = LinkCardView(imageName: "img13", alpha: 0.3, title: "[자료구조] 트리 (Tree", blog: "kdb.velog", index: 0)
    private let fourteenBlogView = LinkCardView(imageName: "img14", alpha: 0.3, title: "[알고리즘] 벨만-포드 알고리즘 (Bellman-Ford Algorithm)", blog: "kdb.velog", index: 0)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Action Properties
    @objc private func presentToPopUp(_ sender: UIButton) {
        let popupVC = PopUpViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        self.present(popupVC, animated: false)
    }
}

// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {

        self.view.addSubViews(backgroundImg, presentPopUPButton)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        backgroundImg.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(103)
        }
        
        presentPopUPButton.snp.makeConstraints { make in
            make.width.equalTo(277)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(43)
        }
        //
        //        firstBlogView.snp.makeConstraints { make in
        //            make.top.equalToSuperview().inset(35)
        //            make.leading.equalToSuperview().inset(25)
        //        }
        //
        //        secondBlogView.snp.makeConstraints { make in
        //            make.top.equalTo(firstBlogView.snp.top)
        //            make.leading.equalTo(firstBlogView.snp.trailing).offset(20)
        //        }
        //        thirdBlogView.snp.makeConstraints { make in
        //            make.top.equalTo(secondBlogView.snp.bottom).offset(40)
        //            make.leading.equalTo(secondBlogView.snp.trailing).offset(20)
        //        }
        //        fourthBlogView.snp.makeConstraints { make in}
        //        fifthBlogView.snp.makeConstraints { make in}
        //        sixthBlogView.snp.makeConstraints { make in}
        //
        ////        seventhBlogView.snp.makeConstraints { make in
        //            make.top.equalToSuperview().inset(250)
        //            make.leading.equalToSuperview().inset(350)
        //        }
        //
        //        eighthBlogView.snp.makeConstraints { make in}
        //
        //        ninethBlogView.snp.makeConstraints { make in}
        //        tenthBlogView.snp.makeConstraints { make in}
        //        eleventhBlogView.snp.makeConstraints { make in}
        //        twelvthBlogView.snp.makeConstraints { make in}
        //        thirteenthBlogView.snp.makeConstraints { make in}
        //        fourteenBlogView.snp.makeConstraints { make in}
        
        
    }
    
    
}

