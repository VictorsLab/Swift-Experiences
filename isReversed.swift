/** An isReversed implementation using only mathematical functions. 
The function is divided in two parts: first it get the length of the input number, 
dividing it by 10 and incrementing a length variable. Then, using the length information, 
it start dividing the input value by pow(10,length), decrementing length each interation. 
Reverting the decimal place of each character number, using math operations, 
it is possible to get the reversed number.
*/
func isReversed(_ val: Int) -> Bool {
    if val < 10 { return true }
    
    var valAux: Int = val/10
    var valLength = 1
    
    // increments length (get the length of val)
    while valAux >= 1 {
        valAux /= 10
        valLength += 1
    }
    
    valLength
    
    // reuse valAux for other purpose to optimize memory
    valAux = val
    var revVal = 0
    var loopCount = 1
    var tempVal: Int
    
    // Using decimal places to get reversed value
    while valLength > 0 {
        tempVal = valAux/(pow(10,valLength-1) as NSDecimalNumber).intValue
        valAux -= tempVal * (pow(10,valLength-1) as NSDecimalNumber).intValue
        revVal += tempVal * (pow(10,loopCount-1) as NSDecimalNumber).intValue
        valLength -= 1
        loopCount += 1
    }
    return val == revVal
}

isReversed(12344321)
isReversed(123454321)
isReversed(999999)
isReversed(0)
