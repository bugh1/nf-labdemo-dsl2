#!/usr/bin/env python3

import argparse
import glob
import os
import shutil


def parse_args():

    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(title='subcommands', dest='command')

    subparsers.add_parser('clean')

    return parser.parse_args()


def clean():
    if os.path.isdir('./work'):
        shutil.rmtree('./work')

    if os.path.isdir('./.nextflow'):
        shutil.rmtree('./.nextflow')

    for p in glob.glob('./.nextflow.log*'):
        os.remove(p)

    if os.path.isfile('./capitalized.txt'):
        os.remove('./capitalized.txt')


def main():
    args = parse_args()
    print(args)

    if args.command == 'clean':
        clean()


if __name__ == '__main__':
    # execute only if run as a script
    main()
