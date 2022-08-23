//
//  AssemblyPersonalDiary.swift
//  PersonalDiary
//
//  Created by Artem Serebriakov on 23.08.2022.
//

import UIKit

protocol IPersonalDiary {
    func assemble() -> UIViewController
}

final class AssemblyPersonalDiary: IPersonalDiary {
    func assemble() -> UIViewController {
        let viewController = ViewController()
        return viewController
    }
}
