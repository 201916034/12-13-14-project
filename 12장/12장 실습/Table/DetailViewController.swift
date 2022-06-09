//
//  DetailViewController.swift
//  Table
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    //Main View에서 받을 텍스트를 위해 변수 receive Item을 선언

    @IBOutlet var lblItem: UILabel!
    // lblItem 이름의 아웃렛 변수 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
        //뷰가 노출될 때마다 이 내용을 레이블의 텍스트로 표시
    }
    
    
    func reciveItem(_ item: String)
    //Main View에서 뱐수를 받기 위한 함수를 추가
    {
        receiveItem = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


