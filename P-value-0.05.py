from scipy.stats import kstest
import numpy as np
import  pandas  as pd

if __name__ == "__main__":
    fin = "data/ecoli/ecoli.xls"
    df = pd.read_excel(fin)
    K = 7

    for i in range(K):
        x = df.iloc[:,i].values
        test_stat = kstest(x, 'norm')
        print(test_stat)