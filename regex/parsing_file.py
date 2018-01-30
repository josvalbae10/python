__author__ = 'josemaria'
from parsing_file_config import *

# def parse_data_from_file(output_file_name):
def parse_data_from_file():
    with open(FILENAME_INPUT, 'r') as report:
        results = report.readlines()
        for line in results:
            position = line.find(" ")
            value = line[position+1:]
            if len(value) <= PRECISION and not contains_hash(value) and not contains_time(value):
                # print value
                with open(FILENAME_OUTPUT, 'a') as report_parsed:
                    report_parsed.write(value)

def contains_hash(value):
    found = value.find('#')
    if found == -1:
        return False
    else:
        return True

def contains_time(value):
    found = value.find(':')
    if found == -1:
        return False
    else:
        return True


def clean_results():
    with open(FILENAME_OUTPUT, 'w'):
        pass

#####################################
#               Main                #
#####################################

if __name__ == '__main__':
    print 'Hi man!'
    clean_results()
    # parse_data_from_file('ff_to_regex_parsed')
    parse_data_from_file()
