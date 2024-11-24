#from curses.ascii import isdigit
import findstring
import pytest


def test_isPresent():
    assert findstring.isPresent('John')


def test_noDigit():
    assert findstring.noDigit('John')