#!/usr/bin/env python3

from setuptools import setup, find_packages

NAME = 'hi'

setup(
    name=NAME,
    url=f'https://github.com/ffung/hi',
    packages=find_packages(),
    include_package_data=True,
    python_requires='>=3.6.8',
    zip_safe=False,
    entry_points={
        'console_scripts': [
            f'{NAME}={NAME}:run',
        ],
    },
)
