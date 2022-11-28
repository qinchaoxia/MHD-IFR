import pandas as pd
import glob,os
import csv
import codecs

#遍历文件夹
rootDir = r'../data/AReM/standing'
x = 0
#遍历根目录
for root,dirs,files in os.walk(rootDir):
    ff = glob.glob(os.path.join(root, "*.csv"))
    file_xls = codecs.open((rootDir+"/"+str(x)+".xls"), 'w+', 'utf-8')  # 追加
    x += 1
    writer = csv.writer(file_xls, delimiter=' ', quotechar=' ', quoting=csv.QUOTE_MINIMAL)
    for f in ff:
        #ngData = pd.read_csv(f, header=None, quoting=csv.QUOTE_NONE)
        ngData = pd.read_csv(f, sep='\t', comment='#')
        #ngData = ngData[5:]
        # 添加新列‘type’
        ngType = []
        for index, row in ngData.iterrows():  # 遍历数据表
            ngType.append(4)
        ngData['type'] = ngType
        for index, row in ngData.iterrows():
            writer.writerow(row)
