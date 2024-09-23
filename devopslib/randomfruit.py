from random import choices


def fruit():
    fruits = ["apple", "cherry", "strawberry"]
    return choices(fruits)[0]


# Using below to verify pylint works
# var = 1
# var = var
