def isPresent(person)->bool:
    names = ['John', 'Doe', 'Jane', 'Smith']
    if person in names:
        return True
    else:
        return False
    

def noDigit(person):
    if person.isalpha():
        return True
    else:
        return False
    