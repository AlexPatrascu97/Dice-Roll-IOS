//
//  meniuControllerViewController.swift
//  dice roll
//
//  Created by alex on 16/05/2019.
//  Copyright © 2019 alex. All rights reserved.
//

import UIKit

class meniuControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var exit: UIButton!
    
    @IBAction func exit(_ sender: Any) {
        exit(0)
    }
    
}
