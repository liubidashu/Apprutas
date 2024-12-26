//
//  TrailViewModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import Foundation


class TrailViewModel: ObservableObject {
    @Published var trails: [Trail] = []
    private let service = TrailService()
    
    
    func fetchTrails() {
        Task {
        let result = await service.fetchTrails()
            switch result  {
            case.success(let char):
                trails.append(contentsOf: char.resalts)
            case.failure (let error):
                print("Случилась Ошибка")
                
            }
        }
    }
}
