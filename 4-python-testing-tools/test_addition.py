# test_filename is always prefixed with test_ to be recognized by pytest
#pytest require functions and unit tests require classes

import addition
import pytest 

def test_add():
    assert addition.add(1, 2) == 3
    assert addition.add(0, 0) == 0
    assert addition.add(-1, -1) == -2
    assert addition.add(1, -1) == 0


def test_sub():
    assert addition.sub(1, 2) == -1
    assert addition.sub(0, 0) == 0
    assert addition.sub(-1, -1) == 0
    assert addition.sub(1, -1) == 2

