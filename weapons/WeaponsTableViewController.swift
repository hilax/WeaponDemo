//
//  WeaponsTableViewController.swift
//  weapons
//
//  Created by Hilax on 2018/5/22.
//  Copyright © 2018年 Hilax. All rights reserved.
//

import UIKit

class WeaponsTableViewController: UITableViewController {
    var weapons:[Weapon] = []
        @IBAction func favBtnTap(_ sender: UIButton) {
        //获取到按钮的点
        let btnBos = sender.convert(CGPoint.zero, to: self.tableView)
        //在tableview中通过点知道哪一行
        let indexPath = tableView.indexPathForRow(at: btnBos)!
        //把所设置的值取反
        self.weapons[indexPath.row].favorite = !self.weapons[indexPath.row].favorite
        //记录住该行的cell数值，转向目标行
        let cell = tableView.cellForRow(at: indexPath)as! CardCell
        cell.favorite = weapons[indexPath.row].favorite
        
    }
    func loadJson(){
        let coder = JSONDecoder()
        do {
            let url = Bundle.main.url(forResource: "weapons", withExtension: "json")!
            let data = try Data(contentsOf: url)
            weapons = try coder.decode([Weapon].self, from: data)
        }catch {
            print("解码错误：",error)
        }
    }
//   //json编码
//    func  saveToJson() {
//        let coder = JSONEncoder()
//        do{
//              let data = try coder.encode(weapons)
//            let saveUrl = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("weapons.json")
//            try data.write(to: saveUrl)
//            print("保存成功：路径：",saveUrl)
//
//        } catch {
//            print("编码错误：",error)
//        }
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(named: "theme")!]
        //saveToJson()
        loadJson()
    }
   override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let favAction = UIContextualAction(style: .normal, title: "喜欢") { (_, _, completion) in
        completion(true)
    }
    //设置图片
    favAction.image = #imageLiteral(resourceName: "fav")
    //设置背景色
    favAction.backgroundColor = UIColor.purple
    let  config = UISwipeActionsConfiguration(actions: [favAction])
    return config
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //侧边按钮的方法
        let delAction = UIContextualAction(style: .destructive, title: "删除") { (_, _, completion) in
            //删除数据源中的所有值
            self.weapons.remove(at: indexPath.row)
            //删除tableview中的显示
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //完成
            completion(true)
        }
        let share = UIContextualAction(style: .normal, title: "分享") { (_, _, completion) in
            //分享文字
            let text = "这是绝地求生中的帅气\(self.weapons[indexPath.row].name)!"
            //分享图片
            let image = UIImage(named: self.weapons[indexPath.row].image)!
          let ac = UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
            //检查是否是平板
            if let pc = ac.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    pc.sourceView = cell
                    pc.sourceRect = cell.bounds
                }
                
            }
            //没有关联的按钮显示，有关联的是push，dismiss
            self.present(ac,animated:true)
            completion(true)
            
        }
        
        share.backgroundColor = .orange
        //指定几个按钮
        let config = UISwipeActionsConfiguration(actions: [delAction,share])
        return config
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weapons.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //查看来自Carcell的identified的值
        let id = String(describing: CardCell.self)
        //重复使用该值
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell
        //更新各个数据源数据
       // let weapon = weapons[indexPath.row]
        cell.typeLable.text = weapons[indexPath.row].type
        cell.weaponLable.text = weapons[indexPath.row].name
        cell.originLable.text = weapons[indexPath.row].origin
        cell.backImageView.image = UIImage(named: weapons[indexPath.row].image)
        cell.favorite = weapons[indexPath.row].favorite
        return cell
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeaponDetail" {
            //选中的行
            let  row = tableView.indexPathForSelectedRow!.row
            //转向目标Controller
            let destination = segue.destination as! DetailTableViewController
            destination.weapon = weapons[row]
        }
       
    }
    @IBAction func backToHome(segue: UIStoryboardSegue) {
        
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

  
  
}
