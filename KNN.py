import  pandas  as pd

def distance(x1,x2):
    dist = 0
    H = 24
    for i in range(H):
        #dist += abs(x1[2*i+1] - x2[2*i+1]) + abs(x1[2*i+2] - x2[2*i+2])
        dist += abs(x1[i]-x2[i])
    return dist


def KNN(fin): # Interval normalization
    # df=pd.read_excel('1.xlsx',sheet_name='student')#可以通过sheet_name来指定读取的表单
    df = pd.read_excel(fin)
    row = len(df)  # 行
    H = 24
    n = row // 4 # 4倍交叉验证
    mean_error = 0
    for i in range(4):
        test_set = [[0] * (H+1)] * n
        train_set = [[0] * (H+1)] * 3*n
        if i == 0:
            test_set = df.iloc[0:n].values
            train_set = df.iloc[n:].values
        if i == 1:
            test_set = df.iloc[n:2*n].values
            train_set = (df.iloc[0:n].append(df.iloc[2*n:])).values
        if i == 2:
            test_set = df.iloc[2*n:3*n].values
            train_set = (df.iloc[0:2*n].append(df.iloc[3*n:])).values
        if i == 3:
            test_set = df.iloc[3*n:].values
            train_set = df.iloc[0:3*n].values
        k = 10
        error = 0
        # 1.distance
        for i in range(n):
            res = [
                {"result": train_set[j][H], "distance": distance(test_set[i], train_set[j])}
                for j in range(3 * n)
            ]
            # 2.sort
            res = sorted(res, key=lambda item: item['distance'])
            # 3.top k
            res2 = res[0:k]
            # 4.分类
            temp = 0
            flag = 0
            for p in range(k):
                label = 0
                for q in range(k):
                    if res2[p]['result'] == res2[q]['result']:
                        label += 1
                if label > temp:
                    temp = label
                    flag = res2[p]['result']
            if test_set[i][H] != flag:
                error += 1
        mean_error += error/4

    print("the precision:{:.2f}%".format(100 * (n - mean_error) / n))

if __name__ == "__main__":
    fin = "data/wall/data-MIS.xls"
    KNN(fin)