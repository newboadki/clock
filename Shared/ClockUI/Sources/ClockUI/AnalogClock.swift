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
                Color.white // Takes the whole proposed size as its actual size.
                
                ticks()

                hourNumbers()
                
                HoursHand()
                    .rotationEffect(Angle.degrees(Double(time)/60/60 * 360/12))
                
                MinutesHand()
                    .rotationEffect(Angle.degrees(Double(time)/60 * 360/60))

                SecondsHand()
                    .stroke(configuration.secondsPointerColor, style: StrokeStyle(lineWidth: tickWidth, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle.degrees(Double(time) * 360/60))
                
            }.cornerRadius(g.size.width / 2)
        }
    }
    
    private func ticks() -> some View {
        ForEach(0..<60*4) { tickIndex in
            self.tick(at: tickIndex)
        }
    }
    
    // MARK: - Ticks
    
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
    
    // MARK: - Numbers
    
    private func hourNumbers() -> some View {
        ForEach(1..<13) { hourIndex in
            self.hourNumber(at: hourIndex)
        }
    }

    private func hourNumber(at index: Int) -> some View {
        VStack { // Takes the full proposed size
            Text("\(index)")
                .foregroundColor(.black)
                .rotationEffect(Angle(degrees: -Double(index)/12 * 360))
                .offset(x: 0, y: 20)
            Spacer()
        }
        .rotationEffect(Angle(degrees: Double(index)/12 * 360))
    }
    
    // MARK: - Hands
    
    private struct SecondsHand: Shape {        
        let circleRadius: CGFloat = 3
        
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
        
    private struct MinutesHand: View {
        
        let circleRadius: CGFloat = 3
        
        var body: some View {
            ZStack {
                GeometryReader { proxy in
                    Group {
                        let rect = proxy.frame(in: .local)
                        let path = CapsuleHandPath(circleRadius: circleRadius, distanceToPerimeter: rect.height-15)
                        path.stroke(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                        path.stroke(Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    }
                }
            }
        }
    }

    private struct HoursHand: View {
        
        let circleRadius: CGFloat = 3
        
        var body: some View {
            ZStack {
                GeometryReader { proxy in
                    Group {
                        let rect = proxy.frame(in: .local)
                        let path = CapsuleHandPath(circleRadius: circleRadius, distanceToPerimeter: rect.height/4)
                        path.stroke(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                        path.stroke(Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    }
                }
            }
        }
    }
    
    private struct CapsuleHandPath: Shape {
        let circleRadius: CGFloat
        let distanceToPerimeter: CGFloat
        
        func path(in rect: CGRect) -> Path {
            Path { p in
                p.move(to: CGPoint(x: rect.midX, y: distanceToPerimeter))
                p.addLine(to: CGPoint(x: rect.midX, y: rect.midY - circleRadius))
                p.addEllipse(in: CGRect(center: rect.center, radius: circleRadius))
                p.move(to: CGPoint(x: rect.midX, y: rect.midY + circleRadius))
            }
        }
    }

}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock(seconds: 5400,
                    configuration: AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                                            tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                            secondsPointerColor: Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1)))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
