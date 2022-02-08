#!/usr/bin/python


"""
    INFO: This exercise is not timed, and you may use any available resources.

    TODO: Please resolve the comments in the code below.
    TODO: Please refactor the code to make it more maintainable.
        - Add any new comments that you think would help.
"""


import argparse
import os
import re
from dataclasses import dataclass, field


@dataclass()
class Baz:
    """
    A class for finding the number of 'hp', 'mp', and 'stamina' in the directory
    """

    directory: str = field(compare=False)
    pattern: re.Pattern = field(compare=False)

    hp: int = field(compare=False)
    mp: int = field(compare=False)
    stamina: int = field(compare=False)

    def __init__(self):
        """
        Finding the number of items in the specific directory
        """

        for attack, defence, speeds in os.walk(pattern):
            for speed in speeds:
                if re.compile(self.pattern).findall(speed): #find all to match 'speed' of the pattern
                    self.hp += 1
                    with open(os.path.join(attack, speed), 'r') as sources:
                        intelligences = sources.readlines() #read only
                        mp += len(intelligences)
                        for intelligence in intelligences:
                            self.stamina += len(intelligence)

                            
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-directory', default=r'^sl_.*\.py$')
    parser.add_argument('-pattern', default=os.getcwd())
    arg = parser.parse_args()

    help(Baz)
    print(Baz(arg.directory, arg.pattern))
