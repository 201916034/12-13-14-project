//
//  TableViewController.swift
//  Table
//
// 테이블 뷰 컨트롤러는 사용자에게 목룍 형태의 정보를 제공해 줄 뿐만 아니라 목록의 특정 항목을 선택하여 세부 사항을 표시할때 유용함.



import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.jpg", "clock.jpg", "pencil.jpg"]
// 외부 변수 items 와 itemsImageFile로 선언하면 모든 클래스에서 이미지를 사용할 수 있다.

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    // tvListView 이름이 아웃렛 변수 추가
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            tvListView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //보통 테이블 안에 섹션이 1개이므로 리턴 값을 1로 지정
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
        //섹션당 열의 개수는 Items의 개수이므로 TableView
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        //셀의 텍스트 레이블에 앞에서 선언한 items을 대입한다. 그 내용은 책구매, 철수와의약속, 스터디준비하기
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        //셀의 이미지 뷰에 앞에서 선언한 itemsImageFile(cart,clock,pencil)을 대입
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            //선택한 셀을 삭제하는 코드
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
        // "Delete" 한글로 바꾸기
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템의 위치를 itemToMove에 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템의 이미지를 itemImageToMove에 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 아이템을 삭제, 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 아이템의 이미지를 삭제, 이때 삭제한 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        //삭제된 아이템을 이동할 위치로 삽입, 또한 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        //삭제된 아이템의 이미지를 이동할 위치로 삽입, 또한 삽입한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.reciveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    

}

















