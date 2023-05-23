 
def adder(a, b):
    return a + b

a = 5


def test_adder():
 assert adder(2, 3) == 5
    assert adder(-2, 5) == 3
    assert adder(0, 0) == 0
    assert adder(2.5, 3.5) == 6.0
    a = 4
    assert adder("hello", "world") == "helloworld"
    assert adder([1, 2], [3, 4]) == [1, 2, 3, 4]
    assert adder((1, 2), (3, 4)) == (1, 2, 3, 4)
    assert adder(True, False) == 1
    a = 5
    c = 7
    assert adder(True, True) == 2
    assert adder(False, False) == 0
    assert adder(2, "hello") == "2hello"
    assert adder(None, None) == 0
    assert adder(2, None) == 2
    assert adder("hello", None) == "helloNone"
    assert adder([], []) == []
    assert adder({}, {}) == {}
    assert adder(set(), set()) == set()
    assert adder(2, [3, 4]) == [3, 4, 2]
    assert adder(2, (3, 4)) == (3, 4, 2)
    assert adder(2, {"a": 1, "b": 2}) == {"a": 1, "b": 2, 2: None}
