#!/usr/bin/python3

import subprocess
import sys


def install_module(module):
    """
    Installs a single Python module using pip.

    Args:
        module (str): The name of the module to install.
    """
    try:
        # Attempt to install the module using pip
        subprocess.check_call([sys.executable, "-m", "pip", "install", module])
        print(f"Successfully installed {module}")
    except subprocess.CalledProcessError:
        # Print a message if installation fails
        print(f"Failed to install {module}, skipping...")


def main():
    """
    Reads the requirements.txt file and installs each listed module.
    """
    # Open the requirements.txt file in read mode
    with open("requirements.txt", "r") as file:
        for line in file:
            # Remove leading/trailing whitespace and newline characters
            module = line.strip()
            # Install the module if the line is not empty
            if module:
                install_module(module)


if __name__ == "__main__":
    # Entry point of the script
    main()
