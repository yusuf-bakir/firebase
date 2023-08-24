//
//  ViewController.swift
//  firebase
//
//  Created by yusuf bakır on 26.05.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
//        yenikisi()
//        kisiSil()
//        kisiGüncelle()
//        tümKisileriAll()
         kisiequalsSorgu()
    }
    func yenikisi (){
        let yenikisi = kisiler(kisi_ad: "Burhan", kisi_yas: "34")
        let dict: [String:Any] = ["kisi_ad":yenikisi.kisi_ad!,"kisi_yas":yenikisi.kisi_yas!]
        let newref = ref?.child("kisiler").childByAutoId()
        newref?.setValue(dict)
    }
    func kisiSil (){
        ref?.child("kisiler").child("-NWJz-y4IXz2yw-Ur9uD").removeValue()
    }
    func kisiGüncelle () {
        let dict:[String:Any] = ["kisi_ad":"Abdullah","kisi_yas":"32"]
        ref?.child("kisiler").child("-NWK-TCH36dWR-5yRkJk").updateChildValues(dict)
    }
    func tümKisileriAll () {
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                // Verileri işleme
                for (key, value) in data {
                    print(value)
                }
            }
        }) { (error) in
            print("Veri alma hatası: \(error.localizedDescription)")
        }

            }
    func kisiequalsSorgu () {
        let sorgu = ref?.child("kisiler").child("kisi_ad").queryEqual(toValue: "Burhan")
        sorgu!.observe(.value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                // Verileri işleme
                for (key, value) in data {
                    print(value)
                }
            }
        }) { (error) in
            print("Veri alma hatası: \(error.localizedDescription)")
        }

            }
           
            
        
}

