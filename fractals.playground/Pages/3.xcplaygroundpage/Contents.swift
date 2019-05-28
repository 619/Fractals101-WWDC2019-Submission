//#-hidden-code
//Copyright 2019 MIT
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and /associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//Used this implementation of the Julia Set: https://github.com/gongzhang/julia-set-playground
//#-end-hidden-code
//: [Previous: Fractal Functions](@previous)
//: # Why I made this Book
//: The most common misconception about math, programming, and science is that they are hard, complicated, and for boys only. I wanted to demonstrate the beautiful things you can create with **just a little bit of math and programming knowledge**. No matter who you are, you can turn your ideas into reality with a little bit of effort and some code.
//: ## The Julia Set
//: This is the reward you get for reading my book. **The good stuff!** This fractal is called a **Julia set.** It uses a complex number formula to create a fractal. The numbers you input below will change the colour, pattern, and size of the fractal. Try lots of different combinations and see what kind of crazy shapes you can make!
//: - Note: Works best when values are in between -100 and 100. Don't set colour below -10. 

var x = /*#-editable-code*/39.37/*#-end-editable-code*/
var y = /*#-editable-code*/17.49/*#-end-editable-code*/
var colour = /*#-editable-code*/49.75/*#-end-editable-code*/

//: ## Next Steps
//: I encourage you to look at the code behind the 1st page, the circle example, and try to recreate it. Its well documented, and you can understand it with a bit of effort. Thanks for reading my book and I hope you learned something about fractals!

//: [Next: Conclusion](@next)

//#-hidden-code

import UIKit
import PlaygroundSupport

let imageSize = CGSize(width: 500, height: 500)
var julia = JuliaSet()
var finalx: Double = Double(x) / 100

var finaly: Double = Double(y) / 100

var finalhue: Double = Double(colour) / 100
if (finalx >= 1) {
    finalx = 0.95
} else if (finalx <= -1) {
    finalx = -0.95
    
}
if (finaly >= 1) {
    finaly = 0.95
} else if (finalx <= -1) {
    finaly = -0.95
    
}
if (finalhue >= 2) {
    finalhue = 2
} else if (finalhue <= -0.1) {
    finalhue = -0.05
    
}

julia.window = 4.0
julia.const = Complex(finalx, finaly)
julia.color = JuliaSetColor(hue: finalhue, brightness: 0.8, saturation: 0.9)

JuliaSetRenderer.syncRender(julia, pixelSize: imageSize)
let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
containerView.backgroundColor = UIColor(patternImage: JuliaSetRenderer.syncRender(julia, pixelSize: imageSize))
PlaygroundPage.current.liveView = containerView

//#-end-hidden-code
