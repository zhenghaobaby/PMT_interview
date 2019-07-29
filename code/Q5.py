def Bubble_sort(data):
    orignal_data = data.copy()
    for i in range(len(data)):
        for j in range(len(data)-1-i):
            if data[j]>data[j+1]:
                temp = data[j]
                data[j] = data[j+1]
                data[j+1] = temp

    sort_data = data.copy()

    Index_position = {}
    position = 1
    for k in orignal_data:
        Index_position[k] = position
        position+=1

    Rank_position = {}
    rank = 1
    for k in sort_data:
        Rank_position[k] = rank
        rank+=1

    Index_answer = []
    for i in sort_data:
        Index_answer.append(Index_position[i])

    Rank_answer = []
    for i in orignal_data:
        Rank_answer.append(Rank_position[i])

    return orignal_data,sort_data,Index_answer,Rank_answer

if __name__ == '__main__':
    Input = [31, 2, 11, 23, 8, 7, 11, 14, 20]
    orignal,sort,index,rank = Bubble_sort(Input)
    print(orignal)
    print(sort)
    print(index)
    print(rank)




