import UIKit
import SnapKit
import Then
import SafariServices

class NextViewController: UIViewController {
    
    // MARK: - Properties
    private let backgroundImg = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "newBackgoundImg")
        $0.contentMode = .scaleAspectFit
    }
    
    private let linkButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(goToWebLink), for: .touchUpInside)
    }
    
    private let presentPopUPButton = UIButton().then {
        $0.setTitle("새로운 링크 추가하기", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(presentToPopUp), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImg.isUserInteractionEnabled = true
        
        let btnInteraction = UIContextMenuInteraction(delegate: self)
        linkButton.addInteraction(btnInteraction)
        
        self.view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Action Properties
    @objc private func presentToPopUp(_ sender: UIButton) {
        let popupVC = PopUpViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        self.present(popupVC, animated: false)
    }
    
    @objc private func goToWebLink(_ sender: UIButton) {
        
        let blogUrl = NSURL(string: "https://velog.io/@polynomeer/%EB%8F%99%EC%A0%81-%EA%B3%84%ED%9A%8D%EB%B2%95Dynamic-Programming")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogUrl as! URL)
        self.present(blogSafariView, animated: true, completion: nil)

    }
}

// MARK: - Extensions
extension NextViewController {
    // UI 세팅
    private func setupUI() {

        self.view.addSubViews(backgroundImg, presentPopUPButton)
        backgroundImg.addSubViews(linkButton)
        
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
        
        linkButton.snp.makeConstraints { make in
            make.size.equalTo(120)
            make.top.equalToSuperview().inset(613)
            make.leading.equalToSuperview().inset(275)
        }
        
    }
    
    
}

extension NextViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, 
                                          previewProvider: {
            let previewVC = HTMLViewController()
            return previewVC
        }, actionProvider: nil)
    }
}
