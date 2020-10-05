def solution(p):
    return p if checkRight(p) else work(p)


def checkStable(s):
    return s.count("(") == s.count(")")


def checkRight(s):
    num = 0

    for c in s:
        if c == "(":
            num += 1
        else:
            num -= 1

        if num < 0: return False

    if num == 0:
        return True
    else:
        return False


def work(s):
    if s == "": return ""

    offset = 1
    while offset != len(s):
        if checkStable(s[0:offset]) and checkStable(s[offset:]):
            break
        else:
            offset += 1

    u = s[0:offset]
    v = "" if offset == len(s) else s[offset:]

    if checkRight(u):
        return u + work(v)
    else:
        temp = u[1:len(u) - 1]
        return "(" + work(v) + ")" + revert(temp)


def revert(s):
    result = ""

    for c in s:
        if c == "(":
            result += ")"
        else:
            result += "("

    return result
