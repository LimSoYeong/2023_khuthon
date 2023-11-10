//
//  HTMLViewController.swift
//  KHUthon-App
//
//  Created by 민 on 11/11/23.
//

import UIKit
import WebKit
import Then
import SnapKit

class HTMLViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    private let titleLabel = UILabel().then {
        $0.text = "동적 계획법(Dynamic Programming)"
        $0.textColor = UIColor(red: 42.0 / 255.0, green: 57.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
        $0.textAlignment = .center
        $0.textColor = .white
    }
    private let blogLablel = UILabel().then {
        $0.text = "polynomeer.log"
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.textColor = .white
    }
    private let sentenceSummaryLabel = UILabel().then {
        $0.text = "DP는 큰 문제를 작은 문제로 나누어서 푸는 방식의 \n 알고리즘으로 분할 정복과 가장 큰 차이점은 분할 정복은 \n 쪼개진 작은 문제가 중복되지만 분할 정복은 절대로 \n 중복될 수 없다는 점이다."
        $0.numberOfLines = 5
        $0.textColor = .systemGray2
        $0.textAlignment = .center
    }
    private let keywordStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    private let firstKeywordLabel = UILabel().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 42.0 / 255.0, green: 57.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
        $0.text = "문제 수식"
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.textAlignment = .center

    }
    private let secondKeywordLabel = UILabel().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 42.0 / 255.0, green: 57.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
        $0.text = "코드 작성"
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
        $0.layer.masksToBounds = true
    }
    private let thirdKeywordLabel = UILabel().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 42.0 / 255.0, green: 57.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
        $0.text = "재귀 알고리즘"
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
        $0.layer.masksToBounds = true
    }
    // private var webView = WKWebView()
    private lazy var webView: WKWebView = {
            let webView = WKWebView(frame: self.view.frame)
            webView.allowsBackForwardNavigationGestures = true
            webView.uiDelegate = self
            webView.navigationDelegate = self
            return webView
        }()
    
//    /// HTML 페이지를 로드합니다.
//    func loadHTMLpage() {
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//        
//        // 파일이름 ex) blog.html
//        let resourceString = "test"
//        guard let url = Bundle.main.url(forResource: resourceString,
//                                        withExtension: "html")
//        else {
//            print("guard문에 걸려버렸어요.")
//            return
//        }
//        
//        // 1. 왼쪽
//        webView.load(URLRequest(url: URL(string: "{ notion url }")!))
//        // 2. 가운데
//        webView.loadFileURL(url, allowingReadAccessTo: url)
//        // 3. 오른쪽
//        webView.loadHTMLString(htmlStringText, baseURL: nil)
//        
//    }
    
    func loadWeb() {
        self.view.addSubview(webView)

        guard let url = URL(string: "https://velog.io/@polynomeer/%EB%8F%99%EC%A0%81-%EA%B3%84%ED%9A%8D%EB%B2%95Dynamic-Programming") else { return }
        let request = URLRequest(url: url)

        webView.load(request)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubViews(titleLabel,
                         blogLablel,
                         sentenceSummaryLabel,
                         keywordStackView,
                         webView)
        keywordStackView.addArrangeSubViews(firstKeywordLabel,
                                            secondKeywordLabel,
                                            thirdKeywordLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(25)
            make.width.equalTo(400)
        }
        blogLablel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        webView.snp.makeConstraints { make in
            // make.leading.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(blogLablel.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(150)
        }
        keywordStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(webView.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        firstKeywordLabel.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(54)
        }
        secondKeywordLabel.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(54)
        }
        thirdKeywordLabel.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(54)
        }
        sentenceSummaryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(keywordStackView.snp.bottom).offset(28)
        }

        loadWeb()
    }
    
}

let htmlStringText = """
<html>
    <head>
        <meta charset="utf-8">
        
            <script src="lib/bindings/utils.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis-network/9.1.2/dist/dist/vis-network.min.css" integrity="sha512-WgxfT5LWjfszlPHXRmBWHkV2eceiWTOBvrKCNbdgDYTHrT2AeLCGbF4sZlZw3UMN3WtL0tGUoIAKsu8mllg/XA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/vis-network/9.1.2/dist/vis-network.min.js" integrity="sha512-LnvoEWDFrqGHlHmDD2101OrLcbsfkrzoSpvtSQtxK3RMnRV0eOkhhBN2dXHKRrUU8p2DGRTk35n4O8nWSVe1mQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            
        
<center>
<h1></h1>
</center>

<!-- <link rel="stylesheet" href="../node_modules/vis/dist/vis.min.css" type="text/css" />
<script type="text/javascript" src="../node_modules/vis/dist/vis.js"> </script>-->
        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
          crossorigin="anonymous"
        />
        <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
          crossorigin="anonymous"
        ></script>


        <center>
          <h1></h1>
        </center>
        <style type="text/css">

             #mynetwork {
                 width: 100%;
                 height: 1000px;
                 background-color: #ffffff;
                 border: 1px solid lightgray;
                 position: relative;
                 float: left;
             }

             

             

             
        </style>
    </head>


    <body>
        <div class="card" style="width: 100%">
            
            
            <div id="mynetwork" class="card-body"></div>
        </div>

        
        

        <script type="text/javascript">

              // initialize global variables.
              var edges;
              var nodes;
              var allNodes;
              var allEdges;
              var nodeColors;
              var originalNodes;
              var network;
              var container;
              var options, data;
              var filter = {
                  item : '',
                  property : '',
                  value : []
              };

              

              

              // This method is responsible for drawing the graph, returns the drawn network
              function drawGraph() {
                  var container = document.getElementById('mynetwork');

                  

                  // parsing and collecting nodes and edges from the python
                  nodes = new vis.DataSet([{"color": "#97c2fc", "id": "\u{c18c}\u{c601}", "image": "https://velog.velcdn.com/images/junttang/post/3b5d7eb6-6b64-4360-8f51-afd647cbb942/image.png", "label": "\u{c18c}\u{c601}", "shape": "image", "title": "\u{c18c}\u{c601}"}, {"color": "#97c2fc", "id": "\u{bbfc}\u{c7ac}", "image": "https://velog.velcdn.com/images/junttang/post/3b5d7eb6-6b64-4360-8f51-afd647cbb942/image.png", "label": "\u{bbfc}\u{c7ac}", "shape": "image", "title": "\u{bbfc}\u{c7ac}"}, {"color": "#97c2fc", "id": "\u{ba85}\u{c740}", "image": "https://velog.velcdn.com/images/junttang/post/3b5d7eb6-6b64-4360-8f51-afd647cbb942/image.png", "label": "\u{ba85}\u{c740}", "shape": "image", "title": "\u{ba85}\u{c740}"}, {"color": "#97c2fc", "id": "\u{d61c}\u{c9c0}", "image": "https://velog.velcdn.com/images/junttang/post/3b5d7eb6-6b64-4360-8f51-afd647cbb942/image.png", "label": "\u{d61c}\u{c9c0}", "shape": "image", "title": "\u{d61c}\u{c9c0}"}]);
                  edges = new vis.DataSet([{"from": "\u{c18c}\u{c601}", "to": "\u{bbfc}\u{c7ac}", "value": 10}, {"from": "\u{ba85}\u{c740}", "to": "\u{c18c}\u{c601}", "value": 20}, {"from": "\u{d61c}\u{c9c0}", "to": "\u{ba85}\u{c740}", "value": 30}, {"color": "red", "from": "\u{bbfc}\u{c7ac}", "to": "\u{d61c}\u{c9c0}", "value": 90}]);

                  nodeColors = {};
                  allNodes = nodes.get({ returnType: "Object" });
                  for (nodeId in allNodes) {
                    nodeColors[nodeId] = allNodes[nodeId].color;
                  }
                  allEdges = edges.get({ returnType: "Object" });
                  // adding nodes and edges to the graph
                  data = {nodes: nodes, edges: edges};

                  var options = {
    "configure": {
        "enabled": false
    },
    "edges": {
        "color": {
            "inherit": true
        },
        "smooth": {
            "enabled": true,
            "type": "dynamic"
        }
    },
    "interaction": {
        "dragNodes": true,
        "hideEdgesOnDrag": false,
        "hideNodesOnDrag": false
    },
    "physics": {
        "barnesHut": {
            "avoidOverlap": 0,
            "centralGravity": 0.6,
            "damping": 0.09,
            "gravitationalConstant": -8000,
            "springConstant": 0.001,
            "springLength": 200
        },
        "enabled": true,
        "stabilization": {
            "enabled": true,
            "fit": true,
            "iterations": 1000,
            "onlyDynamicEdges": false,
            "updateInterval": 50
        }
    }
};

                  


                  

                  network = new vis.Network(container, data, options);

                  

                  

                  


                  

                  return network;

              }
              drawGraph();
        </script>
    </body>
</html>

"""
