import pandas as pd
import numpy as np

def Note(fin):
    df = pd.read_excel(fin)
    n = len(df)
    d1 = df.iloc[:].values
    c = 2
    t1 = [0] * c
    t2 = np.zeros((c, c))
    for p in range(n):
        if d1[p][0] == 0:
            t1[0] += 1
            if d1[p][1] == 1:
                t2[0][0] += 1
            if d1[p][1] == 2:
                t2[0][1] += 1

        if d1[p][0] == 1:
            t1[1] += 1
            if d1[p][1] == 1:
                t2[1][0] += 1
            if d1[p][1] == 2:
                t2[1][1] += 1


    p = 0
    cc = c
    for i in range(c):
        label = 0
        for j in range(c):
            if label <= t2[i][j]:
                label = t2[i][j]
        if t1[i]==0:
            p += 0
            cc -= 1
        else:
            p += label/t1[i]
        #print(label)
    print("the precision:{:.2f}%".format(100*p/cc))


if __name__ == "__main__":
    fin = "data/trip/data-S-Inv-labels.xls"
    Note(fin)

