#!/usr/bin/python3

import argparse


def extract(start: int, size: int, input: str, output: str):
    """Extracts ``size`` bytes from ``input``, at offset ``start``, and writes it to ``output``

    Parameters:
    - ``start``: int, defines where to start reading the file
    - ``size``: int, how many bytes to read from the file
    - ``input``: str, path to the file to read
    - ``output``: str, path to the file to write
    """

    with open(input, "rb") as file:
        file.seek(start)
        data = file.read(size)

    with open(output, "wb") as file:
        file.write(data)


def main():
    parser = argparse.ArgumentParser(description="Extracts data from a file for HackerOoT.")

    parser.add_argument(
        "--start",
        dest="start",
        help="Offset to the data (uses hex)",
        required=True,
    )

    parser.add_argument(
        "--size",
        dest="size",
        help="How much to read (uses hex)",
        required=True,
    )

    parser.add_argument(
        "--input",
        dest="input",
        help="Input file",
        required=True,
    )

    parser.add_argument(
        "--output",
        dest="output",
        help="Output file",
        required=True,
    )

    args = parser.parse_args()
    extract(int(args.start, 16), int(args.size, 16), args.input, args.output)
    print("Data extracted successfully!")


if __name__ == "__main__":
    main()
