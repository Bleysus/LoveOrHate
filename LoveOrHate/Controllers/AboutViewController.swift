//
//  AboutViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 10.02.2020.
//  Copyright © 2020 Bleysus.com. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet var viewBack: UIView!
    
    let aboutText = """
    Итак, что же это за дичь мы тут скачали? Ну, если не читали описание, а просто жамкнули, или уже забыли, то я попробую рассказать.
    Это что-то наподобие списка дел, но без дел (звучит странно, да?), а с событиями, вещами, решениями, да и всем, что придет в голову, и возможностью делать оценку с помощью любви и ненависти (лайки и дизлаки, простым языком). Зачем, спросите вы, мне эта чушь? "Я не злопамятный, у меня память хорошая". Добавили в список подругу/друга и ведем статистику поведения. Не вернул сотку через неделю, как обещал? Черное сердечко ему. Купил вкусняшку? Два красных! Ну, и так далее, дальше сами разберетесь. Увольняться или нет с работы, какой факультатив выбрать, прогулять урок или идти на него, все упираеться лишь в вашу фантазию.

Вопросы:
Q: Почему окно любви само закрывается после того, как я нажму на сердечко?
A: Чтобы не жамкать каждый раз на кнопку "закрыть" после добавления любви/ненависти. Не нравится? Да, не вопрос, в настройках можно выключить.

Q: Почему названия любви подставляются сами? И какие-то странные...
A: Если вы никак не назвали свою любовь сами, программа ее назовет за вас. Искусственный интеллект, ага! Если хотите пустую любовь - поставьте пробел.

Q: Мне не нравится дизайн! Глаз дергается от этого ужаса!
A: Очень мало людей могут совмещать в себе таланты дизайнера и программиста. Как вы догадались, я - программист. Прочитал рекомендации Apple по созданию дизайна пользовательского интерфейса и еще какие-то умные статьи. Большую часть забыл сразу же, но я старался, честно-честно!

Q: Почему так мало функций? Хочу еще пасьянс косынку и будильник!
A: Пишите предложения, буду думать. Можно и по дизайну тоже, лучше, конечно, в Sketch.

Ну и вообще, в настройках еще можно жамкнуть и написать мне на почту. Пишите, если что, я не кусаюсь. Ам :)
Да, кстати, в программе есть пасхалочка, и это не автоподстановка жутких текстов.
"""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
switch K.isDarkTheme {
case true:
    viewBack.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    //viewBack.backgroundColor = UIColor.gray
    aboutTextView.backgroundColor = UIColor.black
    aboutTextView.textColor = UIColor.white
    
case false:
    viewBack.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    //viewBack.backgroundColor = UIColor.gray
    aboutTextView.backgroundColor = UIColor.white
    aboutTextView.textColor = UIColor.black
}
        
        

        aboutTextView.text = aboutText
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
