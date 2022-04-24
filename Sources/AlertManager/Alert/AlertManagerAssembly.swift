//
//  File.swift
//  
//
//  Created by Арман Чархчян on 22.04.2022.
//

import Foundation
import Swinject

public final class AlertManagerAssembly {
    public static func assemble(container: Container) {
        container.register(AlertManagerProtocol.self) { r in
            AlertManager()
        }
    }
}
