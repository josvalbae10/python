import tablib

headers = ('first_name', 'last_name')

data = [
    ('John', 'Adams'),
    ('George', 'Washington')
]

data = tablib.Dataset(*data, headers=headers)

#print(data)


data.append(('Henry', 'Ford'))

#print(data)

data.append_col((90, 67, 83), header='age')

#print("\n")
#print(data)


# Exporting to JSON
#print(data.export('json'))


# Exporting to YAML
print(data.export('yaml'))

# Exporting to CSV
csv_data = data.export('csv')
print(csv_data)

with open("people.csv", "w") as fd:
    fd.write(data.export('csv'))

with open("people.yaml", "w") as fd:
    fd.write(data.export('yaml'))

with open('people.xls', 'wb') as f:
    f.write(data.export('xls'))


data1 = tablib.Dataset()
data1.csv = open('people.csv').read()
print("data1")
print(data1)


#anomaly = tablib.Dataset()
#anomaly.yaml = open("3_401_1.yaml").read()

# Grab CSV and generate yaml
emails_3 = tablib.Dataset()
emails_3.csv = open('emails.csv').read()
print(emails_3)
print(emails_3._data.__len__())
a1 = emails_3._data.pop(0).list
print(a1)
print(type(a1))
for x in a1:
    print(x)

#with open('anomaly3.yaml') as f:
#    f.write()