//
//  NewOnboardingSecondView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 08.07.2022.
//

import SwiftUI

struct NewOnboardingSecondView: View {
    
    @StateObject var viewModel: OnboardingSecondViewModel
    
    let gradientColors = Gradient(colors: [Color(R.color.lightGreen()!), Color(R.color.green()!)])
    
    var  gradientBackGraund: LinearGradient {
        LinearGradient(gradient: gradientColors,
                       startPoint: .leading,
                       endPoint: .trailing)
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
           
            VStack(spacing: 0) {
           
                Spacer()
                
                Image(R.image.onboarding_logo_2.name)
                
                Spacer()

                Text(R.string.localization.onsecondTitle())
                    .font(.system(size: 22, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                Text(R.string.localization.onsecondSubtitle())
                    .font(.system(size: 12, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 42)
                            
                Button(action: { viewModel.nextEvent.send(()) }) {
                    Text(R.string.localization.onsecondButtonNext())
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 175, height: 57)
                        .background(gradientBackGraund)
                        .cornerRadius(15)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

