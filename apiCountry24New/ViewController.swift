//
//  ViewController.swift
//  apiCountry24New
//
//  Created by R&W on 24/03/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var arr : [WelcomeElement] = []
    
    @IBOutlet weak var tableviewForCountry: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    func getdata(){
        let url = URL(string: "https://restcountries.com/v3.1/all")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        URLSession.shared.dataTask(with: ur) { data,responce,error in
            
            do{
                if error == nil{
                    self.arr = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                    DispatchQueue.main.async {
                        self.tableviewForCountry.reloadData()
                    }
                    //print(self.arr)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewForCountry.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.label1.text = arr[indexPath.row].name.common
        cell.label2.text = arr[indexPath.row].name.official
        cell.img.image = stringForImg(link: arr[indexPath.row].flags.png)
        return cell
    }
   
    func stringForImg(link:String) -> UIImage?{
        let url1 = URL(string: link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}


