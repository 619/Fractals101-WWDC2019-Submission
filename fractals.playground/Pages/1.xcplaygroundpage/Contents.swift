//#-hidden-code
//Copyright 2019 MIT
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and /associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//#-end-hidden-code
//: # What is a Fractal?
//: **Fractals are cool patterns that repeat themselves.** If you look at an image of a fractal and then zoom in on one part, chances are you might **see the same pattern!** Fractals come in any shape or size you can imagine. If you think it, you can create it!
//: ## Whats so special about a fractal?
//: **Coding a fractal is simple and elegant!** To code a fractal you need a special type of function called a **recursive function**. A function is a block of code that does something when called. A **recursive function** is a function that **calls itself!**
//:
//: ## For Example:
//:
//: ### Bobby's Function (does the following things)
//:
//: - Create a circle with given radius size
//: - Call Bobby's Function Again with Half the radius
//:
//: If you called my function once, it would create a circle, then it would create a circle with half the radius, then again and again, eventually creating a ring of circles like a bullseye. With just one call of the function, you can create many circles.
//: ## Another Cool Trick to Try:
//: We can also make our function draw another smaller circle to the left and to the right every time it runs. Try setting the fields below to be true!
//: - Note: If circles = 1, the function will draw the bullseye. If its not, it will also draw smaller circles to the left and right. Try setting circles to another number!

//#-hidden-code
var circles = 1
//#-end-hidden-code


circles = /*#-editable-code*/1/*#-end-editable-code*/

//: [Next: Fractal Functions](@next)

//#-hidden-code

//Importing code we can use.
import UIKit
import PlaygroundSupport

//This function draws the bullseye.
func simpleCircleDraw(x: Double, y: Double, radius: Double) {
    
    //point is the centre of the circle.
    let point = CGPoint(x: x, y: y)
    
    //This line draws the circle.
    let a = UIBezierPath(arcCenter: point, radius: CGFloat(radius), startAngle: 0, endAngle: 360, clockwise: true)
    
    //We want to keep drawing circles when the radius is larger than 8, otherwise we stop.
    if radius > 8 {
        UIColor.black.setStroke()
        UIColor.black.setFill()
        a.lineWidth = 2
        a.stroke()
        //This is the recursive part. We call the function AGAIN, except this time, we use a smaller radius.
        simpleCircleDraw(x: x, y: y, radius: radius * 0.80 )
        
    }
    
}
//This function draws the circle with smaller circles to the left and right.
func circleDraw(x: Double, y: Double, radius: Double) {
    
    //point is the centre of the circle.
    let point = CGPoint(x: x, y: y)
    
    //This line draws the circle.
    let a = UIBezierPath(arcCenter: point, radius: CGFloat(radius), startAngle: 0, endAngle: 360, clockwise: true)
    
    //We want to keep drawing circles when the radius is larger than 8, otherwise we stop.
    if radius > 8 {
        UIColor.black.setStroke()
        UIColor.black.setFill()
        a.lineWidth = 2
        a.stroke()
        //This is the recursive part. We call the function again on the left side, except this time, we use a smaller radius.
        if (circles != 1) {
            circleDraw(x: x - radius, y: y, radius: radius * 0.5 )
            circleDraw(x: x + radius, y: y, radius: radius * 0.5 )
        }

    }
    
}

//Graphics rendering, and showing the circles on the screen.
UIGraphicsBeginImageContextWithOptions(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width), false, 0)

//Here is where we call the functions above.
if (circles != 1) {
    circleDraw(x: 216, y: 216, radius: 250)
} else {
    simpleCircleDraw(x: 216, y: 216, radius: 250)
}

let im = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
containerView.addSubview(UIImageView(image: im))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

//#-end-hidden-code
