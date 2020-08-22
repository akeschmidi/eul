//
//  EulComponent.swift
//  eul
//
//  Created by Gao Sun on 2020/8/22.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import Foundation
import SwiftUI

enum EulComponent: String, CaseIterable, Identifiable {
    var id: String {
        rawValue
    }

    case CPU
    case Fan
    case Memory
    case Battery
    case Network
}

struct ComponentConfig {
    let viewBuilder: SizeChangeViewBuilder
}

func getComponentConfig(_ component: EulComponent) -> ComponentConfig {
    switch component {
    case .CPU:
        return ComponentConfig(viewBuilder: { AnyView(CpuView(onSizeChange: $0)) })
    case .Fan:
        return ComponentConfig(viewBuilder: { AnyView(FanView(onSizeChange: $0)) })
    case .Memory:
        return ComponentConfig(viewBuilder: { AnyView(MemoryView(onSizeChange: $0)) })
    case .Battery:
        return ComponentConfig(viewBuilder: { AnyView(BatteryView(onSizeChange: $0)) })
    case .Network:
        return ComponentConfig(viewBuilder: { AnyView(NetworkView(onSizeChange: $0)) })
    }
}