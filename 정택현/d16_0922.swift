import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let answer:Int64 = Int64(w) * Int64(h)
    var gcd = 0
    
    // 최대 공약수
    func getGcd(a: Int,b: Int) -> Int {
        // a > b
        if b == 0 {
            return a
        } else {
            return getGcd(a: b, b: a%b)
        }
    }
    
    if w > h {
        gcd = getGcd(a: w, b: h)
    }else {
        gcd = getGcd(a: h, b: w)
    }
    
    // 직사각형에서 대각선을 지나는 사각형 갯수
    // 가로 + 세로 - 최대공약수
    
    return answer - Int64( w + h - gcd)
}

