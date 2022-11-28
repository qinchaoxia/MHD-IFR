import pandas as pd
import glob,os
import csv
import codecs

import xlwt

path = r'../data/AReM'
ff = glob.glob(os.path.join(path, "*.xls"))
x = 1
file_xls = '../data/AReM/xls/type4.xls'
xls = xlwt.Workbook()
sheet = xls.add_sheet('sheet1', cell_overwrite_ok=True)
for f in ff:
   ngData = pd.read_excel(f, header=None)
   # 取区间值
   k = 6
   min = [0] * k
   max = [0] * k
   for index, row in ngData.iterrows():  # 遍历数据表
       for j in range(len(row)):
            if float(min[j]) >= float(row[j]):
                min[j] = row[j]
            if float(max[j]) <= float(row[j]):
                max[j] = row[j]
   for j in range(k):
        sheet.write(x, 2*j, float(min[j]))
        sheet.write(x, 2*j+1, float(max[j]))
   x += 1
xls.save(file_xls)  # 保存xls文件
