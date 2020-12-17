from xlrd import open_workbook

dict_list = []
book = open_workbook('C:\\Users\\quannt\\PycharmProjects\\Automationpython\\Data.xlsx')
sheet = book.sheet_by_index(0)

# read first row for keys  
keys = sheet.row_values(0)

# read the rest rows for values
values = [sheet.row_values(i) for i in range(1, sheet.nrows)]

for value in values:
    dict_list.append(dict(zip(keys, value)))

print(dict_list)