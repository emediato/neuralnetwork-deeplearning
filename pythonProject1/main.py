# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
from statistics import mean

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

def give_me_avg(vec):
    print(mean(vec))



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

    give_me_avg([16, 7, 11, 6, 27]) # 0 V

    give_me_avg([213, 262, 256, 272, 269, 263, 261]) # 10 V

    give_me_avg([746, 728, 760, 741, 746, 744, 745, 762, 736]) # 20 V

    give_me_avg([82.4, 74.15, 50.52, 67.38, 49.27, 86.35, 73.5, 69.77, 66, 74.28]) # 20 V
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
