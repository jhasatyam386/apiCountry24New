//
//  ViewController2.swift
//  apiCountry24New
//
//  Created by R&W on 29/03/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    var name = ""
    var populations = ""
     var imageForflag = UIImage()
     var imageForRupess = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        label11.text = name
        label22.text = populations
        image11.image = imageForflag
        image12.image = imageForRupess
    }
    

  
}
