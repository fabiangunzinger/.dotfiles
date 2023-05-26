
import sys
import import
import numpy as np
import pandas as pd
import pytest

mylist = [1, 2, 3, 4, 5]

def add(a, b):
    return a + b


a = 5


def test_adder():
    assert add(2, 3) == 5
    assert add(-2, 5) == 3
    assert add(0, 0) == 0
    assert add(2.5, 3.5) == 6.0
    a = 4
    assert add("hello", "world") == "helloworld"
    assert add([1, 2], [3, 4]) == [1, 2, 3, 4]
    assert add((1, 2), (3, 4)) == (1, 2, 3, 4)
    assert add(True, False) == 1
    a = 5
    c = 7
    assert add(True, True) == 2
    assert add(False, False) == 0
    assert add(2, "hello") == "2hello"
    assert add(None, None) == 0
    assert add(2, None) == 2
    assert add("hello", None) == "helloNone"
    assert add([], []) == []
    assert add({}, {}) == {}
    assert add(set(), set()) == set()
    assert add(2, [3, 4]) == [3, 4, 2]
    assert add(2, (3, 4)) == (3, 4, 2)
    assert add(2, {"a": 1, "b": 2}) == {"a": 1, "b": 2, 2: None}
