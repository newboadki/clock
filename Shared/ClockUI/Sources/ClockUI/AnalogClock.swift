import SwiftUI
import CoreGraphics

/// This class is Multiplatform
public struct AnalogClock: View {
    
    // MARK: - Public properties
    
    public var time: TimeInterval = 10
    
    // MARK: - PRivate properties
    private let tickWidth: CGFloat = 2
    private let configuration: AnalogClockConfiguration
    
    // MARK: - Initializers
    
    public init(seconds: TimeInterval, configuration: AnalogClockConfiguration) {
        self.time = seconds
        self.configuration = configuration
    }
    
    public var body: some View {
        GeometryReader { g in
            ZStack {
                Color.white
                
                ForEach(0..<60*4) { tickIndex in
                    self.tick(at: tickIndex)
                }
                Pointer()
                    .stroke(configuration.secondsPointerColor, lineWidth: tickWidth)
                    .rotationEffect(Angle.degrees(Double(time) * 360/60))
                
            }.cornerRadius(g.size.width / 2)
        }
    }
    
    private func tick(at index: Int) -> some View {
        VStack { // Takes the full proposed size
            Rectangle()
                .fill(configuration.tickColor)
                .opacity(index % 20 == 0 ? 1 : 0.2)
                .frame(width: tickWidth, height: index % 4 == 0 ? 15 : 8)
            Spacer()
        }
        .rotationEffect(Angle(degrees: Double(index)/240 * 360))
    }
    
    private struct Pointer: Shape {
        
        private let circleRadius: CGFloat = 3
        
        func path(in rect: CGRect) -> Path {
            Path { p in
                p.move(to: CGPoint(x: rect.midX, y: rect.minY))
                p.addLine(to: CGPoint(x: rect.midX, y: rect.midY - circleRadius))
                p.addEllipse(in: CGRect(center: rect.center, radius: circleRadius))
                p.move(to: CGPoint(x: rect.midX, y: rect.midY + circleRadius))
                p.addLine(to: CGPoint(x: rect.midX, y: rect.midY + rect.height / 10))
            }
        }
    }
}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock(seconds: 10,
                    configuration: AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                                            tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                            secondsPointerColor: Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1)))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
