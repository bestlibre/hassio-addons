#!/bin/python3
import pystache
import argparse
import json
import sys


def render(template, data):
    if data == '-':
        context = json.load(sys.stdin)
    else:
        with open(data, 'r') as f:
            context = json.load(f)
    renderer = pystache.Renderer(escape=lambda u: u)
    print(renderer.render_path(template, context))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('template')
    parser.add_argument('data')
    args = parser.parse_args()
    render(args.template, args.data)
