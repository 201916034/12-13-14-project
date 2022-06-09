//
//  AddViewController.swift
//  Table
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    // tfAddItem 이름의 아웃렛 변수 추가
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        //items에 텍스트 필드의 텍스트 값을 추가
        itemsImageFile.append("clock.jpg")
        //itemsImageFile에는 무조건 'clock.jpg' 파일을 추가
        tfAddItem.text=""
        //텍스트 필드의 내용을 지움
        _ = navigationController?.popViewController(animated: true)
        //테이블 뷰로 돌아감
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






