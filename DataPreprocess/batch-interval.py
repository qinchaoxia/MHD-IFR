import pandas as pd
import glob,os
import csv
import codecs

import xlwt

path = r'../data/AReM'
ff = glob.glob(os.path.join(path, "*.xls"))
x = 1
file_xls = '../data/AReM/xls/data.xls'
xls = xlwt.Workbook()
sheet = xls.add_sheet('sheet1', cell_overwrite_ok=True)
for f in ff:
   ngData = pd.read_excel(f)
   # 取区间值
   k = 3
   min = [0] * k
   max = [0] * k
   for index, row in ngData.iterrows():  # 遍历数据表
       sheet.write(x, 0, float(row[0]))
       for j in range(k):
            min[j] = row[2*j+1]-row[2*j+2]
            max[j] = row[2*j+1]+row[2*j+2]
            sheet.write(x, 2*j+1, float(min[j]))
            sheet.write(x, 2*j+2, float(max[j]))
       x += 1
xls.save(file_xls)  # 保存xls文件
