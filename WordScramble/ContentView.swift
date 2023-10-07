//
//  ContentView.swift
//  WordScramble
//
//  Created by 강민혜 on 10/5/23.
//

import SwiftUI

struct ContentView: View {

    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                       
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
        

    }
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        //Exyra validation to come
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
