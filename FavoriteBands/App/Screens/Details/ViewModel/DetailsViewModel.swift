//
//  DetailsViewModel.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

enum DetailsViewControllerStates {
    case loading
    case loaded(MemberDetails)
    case error
}

class DetailsViewModel {
    private var state: Bindable<DetailsViewControllerStates> = Bindable(value: .loading)
    private var service = Service()
    
    let member: MemberDetails
    
    init(member: MemberDetails) {
        self.member = member
    }
    
    func loadDataDetails() {
        service.getDetailsBands { memberDetails in
            self.state.value = .loaded(memberDetails)
        } onError: { error in
            self.state.value = .error
        }
    }
}
