//#-hidden-code
//Copyright 2019 MIT
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and /associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//Used this implementation of iterated function systems: https://github.com/gongzhang/ifs-fractal-playground
//
//#-end-hidden-code
//: [Previous: Circles](@previous)
//: # Fractals in Nature
//: We can easily make a fractal with math, but **fractals are also naturally occurring.** Ever wonder why snowflakes have special patterns? Snowflakes are a natural example of a fractal! Math is everywhere in nature. You can find **geometry** in honeycombs, **symmetry** in spider webs, and **the golden ratio** in flower petals and seashells. Math is even in you; your DNA structure follows the golden ratio. Math is so omnipresent that it can't be a coincidence. 
//: ### To me, methematics, computer science, and the arts are insanely related. They're all creative expressions.
//: ## Sebastian Thrun
//: - Note: These fractals are procedurally generated. By setting special rules for how we draw several lines, and drawing them over and over again, we can make some pretty cool images. Try 1, 2 and 3! Be patient! These fractals take alot of computing power to generate.
let fractal: Int = /*#-editable-code Choose the colour of the fractal*/1/*#-end-editable-code*/
//#-hidden-code

import UIKit
import PlaygroundSupport

var r = Vec(start: (-5, -8), end: (0, -4)).iterate(count: 10, minLength: 0.1, accumulated: true) {
    [
        $0.forward(ratio: 1).rotate(.pi / 16).scale(0.7),
        $0.forward(ratio: 0.7).rotate(.pi / 4).scale(0.5),
        $0.forward(ratio: 0.8).rotate(-.pi / 4.5).scale(0.4)
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.9143830128205128, green: 0.9070474738465375, blue: 0.8002353852985501, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2196755617030675, blue: 0.1571135522156086, alpha: 1), vectors: r)


var b = Vec(start: (-9, -2), end: (9, -2)).iterate(count: 10, minLength: 0.1, accumulated: false) {
    let b = $0.scale(1.0 / 3.0)
    return [
        b,
        b.forward(ratio: 1.0).rotate60d(),
        b.forward(ratio: 2.0).rotate120d().swap(),
        b.forward(ratio: 2.0)
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.5653888283369868, green: 0.7401781643744909, blue: 0.8174278846153846, alpha: 1), fgcolor: #colorLiteral(red: 0.1946326694948552, green: 0.2711999033340959, blue: 1, alpha: 1), vectors: b)


var p = Vec(start: (-2, -4), end: (4, 4)).iterate(count: 20, minLength: 0.2, accumulated: false) {
    [
        $0.scale(sqrt(2) / 2).rotate45d(),
        $0.swap().scale(sqrt(2) / 2).rotate180d().rotate90d().rotate45d()
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.4063196060629969, green: 0.1476675849742995, blue: 0.5, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2488395148723686, blue: 0.9886368439724698, alpha: 1), vectors: p)

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
if (fractal == 1) {
    containerView.addSubview(VecView(bgcolor: #colorLiteral(red: 0.5653888283369868, green: 0.7401781643744909, blue: 0.8174278846153846, alpha: 1), fgcolor: #colorLiteral(red: 0.1946326694948552, green: 0.2711999033340959, blue: 1, alpha: 1), vectors: b))
} else if (fractal == 2) {
    containerView.addSubview(VecView(bgcolor: #colorLiteral(red: 0.4063196060629969, green: 0.1476675849742995, blue: 0.5, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2488395148723686, blue: 0.9886368439724698, alpha: 1), vectors: p))
} else {
    containerView.addSubview(VecView(bgcolor: #colorLiteral(red: 0.9143830128205128, green: 0.9070474738465375, blue: 0.8002353852985501, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2196755617030675, blue: 0.1571135522156086, alpha: 1), vectors: r))

}
PlaygroundPage.current.liveView = containerView

//#-end-hidden-code

//: [Next: Julia Set](@next)
