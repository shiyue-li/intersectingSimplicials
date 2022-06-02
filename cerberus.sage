R = PolynomialRing(QQ, 10, 'x')
gen_list = list(R.gens())
gen_string = [str(i) for i in R.gens()]
gens = [var(gen_string[i]) for i in range(1, len(gen_list))]

sets1 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6]] # n = 6 

def build_matrix(n, sets):
    # given n, a collection of size 4 sets in [n], build the matrix we want
    R = PolynomialRing(RR, n, 'x')
    matrix = []
    for r in range(0, len(sets)):
        print(r)
        row = []
        current = sets[r]
        for c in range(0, n):
            print(gens)
            varc = gens[c]
            if varc in current:
                comp = [x for x in current if x != varc]
                M = Matrix([[1, i, i^2] for i in comp])
                det = M.determinant()
                row.append(det)
            else: 
                row.append(0)
        matrix.append(row)
    return Matrix(matrix)
                
M1 = build_matrix(6, sets1)
print(M1)


minors1 = M1.minors(3)
print(len(minors1))

    
