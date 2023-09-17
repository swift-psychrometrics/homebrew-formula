#!/bin/sh -l

brew tap "$1" && brew audit --strict --online "$2"
