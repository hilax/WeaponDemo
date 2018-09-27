//
//  DetailTableViewController.swift
//  weapons
//
//  Created by Hilax on 2018/5/24.
//  Copyright © 2018年 Hilax. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var headerImageView: UIImageView!
    //类定义必须有值，不然就要设置option类型或者加！号
    var weapon: Weapon!
    var headerView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       headerImageView.image = UIImage(named: weapon.image)
        navigationItem.largeTitleDisplayMode = .never
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor(named: "theme")
        //把表头留空
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        //把留空的表头加上
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
    }
     //获取滚动时的坐标系,处理滚动
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //位移的值为负数
        //print(scrollView.contentOffset.y)
        //位移
        let offsetY = scrollView.contentOffset.y
        //表头大小和位置(frame)变化逻辑
        headerView.frame = CGRect(x: 0, y: offsetY, width: scrollView.bounds.width, height: -offsetY)
    }
    
    @IBOutlet weak var ratingBtn: UIButton!
    @IBAction func backToDetail(segue: UIStoryboardSegue){
        if let rating = segue.identifier{
            weapon.reting = rating
            ratingBtn.setTitle("打分：\(weapon.reting)星", for: .normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
   
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //转场
        let cellId = String(describing: DetailCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell
        switch indexPath.row {
        case 0:
            cell.fieldLable.text = "Name"
            cell.valueLable.text = weapon.name
        case 1:
            cell.fieldLable.text = "Type"
            cell.valueLable.text = weapon.type
        case 2:
            cell.fieldLable.text = "Origin"
            cell.valueLable.text = weapon.origin
        case 3:
            cell.fieldLable.text = "Bullet"
            cell.valueLable.text = weapon.bullet.description
        case 4:
            cell.fieldLable.text = "Muzzle Veolcity"
            cell.valueLable.text = weapon.mv.description
        default:
            cell.fieldLable.isHidden = true
            cell.valueLable.text = weapon.text
        }
       

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
